# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Beer.brand }

    association :user
  end
end
