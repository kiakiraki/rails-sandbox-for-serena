# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Sample Post Title #{n}" }
    content { 'This is the content of the post. ' * rand(10..50) }
    status { 'published' }
    user

    trait :draft do
      status { 'draft' }
    end

    trait :published do
      status { 'published' }
    end

    trait :archived do
      status { 'archived' }
    end

    trait :with_comments do
      after(:create) do |post|
        create_list(:comment, 3, post: post)
      end
    end

    trait :long_content do
      content { 'This is a very long post content. ' * 100 }
    end

    trait :short_content do
      content { 'Short post content.' }
    end
  end
end
# rubocop:enable Metrics/BlockLength
