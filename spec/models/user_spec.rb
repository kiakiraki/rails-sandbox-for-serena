# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe User do
  subject(:user) { build(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_numericality_of(:age).is_greater_than(0).is_less_than(150) }
  end

  describe 'scopes' do
    let!(:adult_user) { create(:user, age: 25) }
    let!(:minor_user) { create(:user, age: 16) }

    describe '.adults' do
      it 'includes users who are 18 or older' do
        expect(described_class.adults).to include(adult_user)
      end

      it 'excludes users under 18' do
        expect(described_class.adults).not_to include(minor_user)
      end
    end

    describe '.by_name' do
      let!(:john) { create(:user, name: 'John Doe') }
      let!(:jane) { create(:user, name: 'Jane Smith') }

      it 'includes users whose name contains the given string' do
        expect(described_class.by_name('John')).to include(john)
      end

      it 'excludes users whose name does not contain the string' do
        expect(described_class.by_name('John')).not_to include(jane)
      end
    end
  end

  describe '#full_display_name' do
    it 'returns name and email' do
      user = build(:user, name: 'John Doe', email: 'john@example.com')
      expect(user.full_display_name).to eq('John Doe (john@example.com)')
    end
  end

  describe '#adult?' do
    it 'returns true for users 18 or older' do
      user = build(:user, age: 18)
      expect(user).to be_adult
    end

    it 'returns false for users under 18' do
      user = build(:user, age: 17)
      expect(user).not_to be_adult
    end
  end

  describe '#recent_posts' do
    let(:user) { create(:user) }
    let!(:old_post) { create(:post, user: user, created_at: 1.week.ago) }
    let!(:new_post) { create(:post, user: user, created_at: 1.day.ago) }

    it 'returns posts ordered by creation date' do
      expect(user.recent_posts).to eq([new_post, old_post])
    end

    it 'limits the number of posts returned' do
      3.times { create(:post, user: user) }
      expect(user.recent_posts(2).size).to eq(2)
    end
  end
end
# rubocop:enable Metrics/BlockLength
