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

  factory :second_food, class: Food do
    item_name { 'tomato2' }
    variety { 'tt' }
    comment { 'good' }
    storage_method { '1week' }
    harvest { '1 week later' }
    price { '100' }
    stock { '1' }
    created_at { DateTime.now +3 }
  end

  factory :third_food, class: Food do
    item_name { 'tomato3' }
    variety { 'tt' }
    comment { 'good' }
    storage_method { '1week' }
    harvest { '1 week later' }
    price { '100' }
    stock { '1' }
    created_at { DateTime.now +5 }
  end
end