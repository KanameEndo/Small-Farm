require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'フードモデル機能', type: :model do
    describe '検索機能' do
      let!(:food) { FactoryBot.create(:food, item_name: 'test') }
      let!(:second_food) { FactoryBot.create(:second_food, name: 'sample') }
      context 'scopeメソッドでタイトルのあいまい検索をした場合' do
        it "検索キーワードを含むフードが絞り込まれる" do
          expect(Food.search_name('test')).to include(food)
          expect(Food.search_name('test')).not_to include(second_food)
          expect(Food.search_name('test').count).to eq 1
        end
      end
    end
    describe 'フードモデル機能', type: :model do
      describe 'バリデーションのテスト' do
        context 'フードの名前が空の場合' do
          it 'バリデーションにひっかる' do
            food = Food.new(
            item_name: nil,
            content: 'food_content',
            )
            expect(food).not_to be_valid
          end
        end
        context 'フードの詳細が空の場合' do
          it 'バリデーションにひっかる' do
            food = Food.new(
            item_name: 'tomato',
            content: nil,
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
end
