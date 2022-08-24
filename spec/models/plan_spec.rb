require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'プランモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'プランのタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          plan = Plan.new(
            title: nil,
            content: 'kk',
            start_time: Datetime.now
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
