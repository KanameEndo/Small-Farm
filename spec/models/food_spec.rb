require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'フードモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'フードの名前が空の場合' do
        it 'バリデーションにひっかる' do
          food = Food.new(
            item_name: nil,
            variety: 'tt',
            comment: 'good',
            storage_method: '1week',
            harvest: '1 week later',
            price: '100',
            stock: '1',
          )
          expect(food).not_to be_valid
        end
      end
      context 'フードの名前と詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          food = FactoryBot.create(
            :food,
            item_name: 'tomato'
            )
            expect(food).to be_valid
        end
      end
    end
  end
end
