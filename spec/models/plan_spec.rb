require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'プランモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'プランのタイトルが空の場合' do
        it 'バリデーションにひっかかる' do
          empty_title = FactoryBot.build(:plan ,title: nil)
          expect(empty_title).not_to be_valid
        end
      end
      context 'プランの内容が空の場合' do
        it 'バリデーションにひっかかる' do
          empty_content = FactoryBot.build(:plan ,content: nil)
          expect(empty_content).not_to be_valid
        end
      end
    end
  end
end
