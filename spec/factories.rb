FactoryBot.define do
    factory :user do
      email { "user@gmail.com" }
      password  { "123456789" }
    end

    factory :region do
      title { "REgion" }
      country  { "Myanmar" }
      currency  { "Kyats" }
      tax  { 3 }
    end

    factory :product do
        title { "REgion" }
        price  { 3000 }
        sku  { "TEST_sku" }
        stock  { 2 }
        association :region, factory: :region
    end

    factory :order do
        name { "Test" }
        address  { "TestAddress" }
        phone  { "+95979984854" }
    end

  end