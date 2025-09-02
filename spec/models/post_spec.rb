# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { build(:post) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(5).is_at_most(100) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_least(10) }
    it { is_expected.to validate_inclusion_of(:status).in_array(%w[draft published archived]) }
  end

  describe "scopes" do
    let(:user) { create(:user) }
    let!(:published_post) { create(:post, user: user, status: "published") }
    let!(:draft_post) { create(:post, user: user, status: "draft") }

    describe ".published" do
      it "returns only published posts" do
        expect(Post.published).to include(published_post)
        expect(Post.published).not_to include(draft_post)
      end
    end

    describe ".by_user" do
      let(:other_user) { create(:user) }
      let!(:other_post) { create(:post, user: other_user) }

      it "returns posts by specific user" do
        expect(Post.by_user(user)).to include(published_post, draft_post)
        expect(Post.by_user(user)).not_to include(other_post)
      end
    end
  end

  describe "#published?" do
    it "returns true for published posts" do
      post = build(:post, status: "published")
      expect(post).to be_published
    end

    it "returns false for non-published posts" do
      post = build(:post, status: "draft")
      expect(post).not_to be_published
    end
  end

  describe "#word_count" do
    it "counts the number of words in content" do
      post = build(:post, content: "This is a test content")
      expect(post.word_count).to eq(5)
    end
  end

  describe "#reading_time" do
    it "calculates reading time based on word count" do
      post = build(:post, content: "word " * 200)
      expect(post.reading_time).to eq(1)
    end

    it "rounds up fractional minutes" do
      post = build(:post, content: "word " * 250)
      expect(post.reading_time).to eq(2)
    end
  end

  describe "#excerpt" do
    it "returns full content if shorter than limit" do
      post = build(:post, content: "Short content")
      expect(post.excerpt).to eq("Short content")
    end

    it "truncates long content with ellipsis" do
      long_content = "a" * 200
      post = build(:post, content: long_content)
      expect(post.excerpt(10)).to eq("#{'a' * 10}...")
    end
  end

  describe "#can_be_edited_by?" do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:post) { create(:post, user: user) }

    it "returns true for the post owner" do
      expect(post.can_be_edited_by?(user)).to be_truthy
    end

    it "returns false for other users" do
      expect(post.can_be_edited_by?(other_user)).to be_falsy
    end
  end
end