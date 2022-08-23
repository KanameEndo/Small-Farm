require 'rails_helper'
RSpec.describe 'フード機能', type: :system do

  before do
    @food = FactoryBot.create(:food)
  end

  describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit foods_path
        fill_in 'q[item_name_or_variety_or_comment_or_storage_method_or_harvest_or_price_cont]', with: 'tomato'
        click_on '検索'
        expect(page).to have_content 'tomato'
      end
    end
  end

  describe '新規作成機能' do
    before do
      @user = FactoryBot.create(:user)
      @food = FactoryBot.create(:food)
      visit new_user_session_path
      fill_in :user_email,with: 'endo00@example.com'
      fill_in :user_password,with: 'endo00'
      click_on'commit'
      visit foods_path
    end
    context '食品を新規作成した場合' do
      it '作成した食品が表示される' do
        visit new_food_path
        fill_in 'food_item_name',with: 'tomato'
        fill_in 'food[variety]',with: 'tt'
        fill_in 'food_comment' ,with: '1week'
        fill_in 'food_storage_method',with: '1 week later'
        fill_in 'food_harvest',with: DateTime.now
        fill_in 'food_price' ,with: '100'
        fill_in 'food_stock' ,with: '1'
        click_on '登録する'
        expect(page).to have_content 'tomato'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit foods_path
        food_list= all('.food_list')
        expect(page).to have_content 'tomato'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意の詳細画面に遷移した場合' do
      it '該当の内容が表示される' do
      food = FactoryBot.create(:food,
        item_name: 'tomato',
        variety: 'tt',
        comment: 'good',
        storage_method: '1week',
        harvest: '1 week later',
        price: '100',
        stock: '1',
      )
      visit food_path(food.id)
      expect(page).to have_content 'good'
      end
    end
  end
end
