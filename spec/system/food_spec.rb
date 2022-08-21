require 'rails_helper'
RSpec.describe 'フード機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @food = FactoryBot.create(:food)
    #アソシエーションが組まれる↑

    visit new_user_session_path
    fill_in :user_email,with: 'endo00@example.com'
    fill_in :user_password,with: 'endo00'
    click_on'submit'
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
    context '食品を新規作成した場合' do
      it '作成した食品が表示される' do
        visit new_food_path
        fill_in 'food[item_name]',with: 'food_name'
        fill_in 'food[variety]',with: 'food_variety'
        fill_in 'food[comment]' ,with: 'food_comment'
        fill_in 'food[storage_method]',with: 'food_storage_method'
        fill_in 'food[harvest]',with: DateTime.now
        fill_in 'food[price]' ,with: 'food_price'
        fill_in 'food[stock]' ,with: 'food_stock'
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

    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        FactoryBot.create(:food, item_name: 'tomato', user: @user)
        FactoryBot.create(:second_food, item_name: 'tomato2', user: @user)
        FactoryBot.create(:third_food, item_name: 'tomato3', user: @user)
        visit foods_path
        food_list= all('.food_list')
        save_and_open_page
        expect(food_list[2]).to have_content 'tomato'
        expect(food_list[1]).to have_content 'tomato2'
        expect(food_list[0]).to have_content 'tomato3'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
      food = FactoryBot.create(:food, item_name: 'tomato', content: 'food', user: @user)
      visit food_path(food.id)
      expect(page).to have_content 'food'
      end
    end
  end
end
