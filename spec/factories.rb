#
# Define factory for models
#
require 'faker'

FactoryGirl.define do

  factory :employee do
    sequence(:name) do |n|
      "Employee #{n}"
    end
    sequence(:code) do |n|
      "NV#{rand(1000..9999)}"
    end
    sequence(:email) do |n|
      "#{n}#{Faker::Internet.email}"
    end
    gender 1
    dob '1990-03-05'
    phone_number '0987654321'
    address 'HCM'
  end


  factory :user do
    sequence(:name) do |n|
      "User #{n}"
    end
    sequence(:email) do |n|
      "#{n}#{Faker::Internet.email}"
    end
    password 'password'
  end
end