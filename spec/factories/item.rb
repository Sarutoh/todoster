# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    item { Faker::Beer.name }

    association :task
  end
end
