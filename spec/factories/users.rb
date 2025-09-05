# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    age { rand(18..65) }
    bio { 'This is a sample bio for the user.' }

    trait :adult do
      age { rand(18..65) }
    end

    trait :minor do
      age { rand(13..17) }
    end

    trait :with_posts do
      after(:create) do |user|
        create_list(:post, 3, user: user)
      end
    end

    trait :with_many_posts do
      after(:create) do |user|
        create_list(:post, 10, user: user)
      end
    end
  end
end
