require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'フードの名前が空の場合' do
    it 'バリデーションにひっかかる' do
      empty_item_name = FactoryBot.build(:food, item_name: nil)
      expect(empty_item_name).not_to be_valid
    end
  end
  context 'コメントが空の場合' do
    it 'バリデーションに引っかかる' do
      empty_comment = FactoryBot.build(:food, comment: nil)
      expect(empty_comment).not_to be_valid
    end
  end
  context '収穫日が空の場合' do
    it 'バリデーションにひっかかる' do
      empty_harvest = FactoryBot.build(:food, harvest: nil)
      expect(empty_harvest).not_to be_valid
    end
  end
  context '料金が空の場合' do
    it 'バリデーションにひっかかる' do
      empty_price = FactoryBot.build(:food, price: nil)
      expect(empty_price).not_to be_valid
    end
  end
end

