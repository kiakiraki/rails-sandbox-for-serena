# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { 'This is a sample comment that provides feedback on the post.' }
    status { 'approved' }
    post
    user

    trait :pending do
      status { 'pending' }
    end

    trait :approved do
      status { 'approved' }
    end

    trait :rejected do
      status { 'rejected' }
    end

    trait :long_comment do
      content { 'This is a very detailed comment that goes into depth about the topic. ' * 10 }
    end

    trait :short_comment do
      content { 'Short comment.' }
    end
  end
end
