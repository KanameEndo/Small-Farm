FactoryBot.define do

  factory :food do
    item_name { 'tomato' }
    variety { 'tt' }
    comment { 'good' }
    storage_method { '1week' }
    harvest { '1 week later' }
    price { '100' }
    stock { '1' }
    created_at { DateTime.now }
  end
end