# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Lorem.characters(number: 6..200) }

    association :user
  end
end
