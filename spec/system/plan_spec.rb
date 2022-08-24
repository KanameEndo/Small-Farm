require 'rails_helper'
RSpec.describe 'プラン機能', type: :system do

  describe '新規作成機能' do
    before do
      @user = FactoryBot.create(:user)
      visit user_session_path
      fill_in :user_email,with: 'endo00@example.com'
      fill_in :user_password,with: 'endo00'
      click_on'commit'
      visit plans_path
    end
    context 'スケジュールを新規作成した場合' do
      it '登録したスケジュールが表示される' do
        visit plans_path
        fill_in 'plan_title',with: 'kome'
        fill_in 'plan_content',with: 'kk'
        select '2022', from: 'plan_start_time_1i'
        select '8月', from: 'plan_start_time_2i'
        select '1', from: 'plan_start_time_3i'
        select '00', from: 'plan_start_time_4i'
        select '00', from: 'plan_start_time_5i'
        click_on 'commit'
        expect(page).to have_content 'kome'
      end
    end
    context '任意の詳細画面に遷移した場合' do
      it '該当の内容が表示される' do
        visit plans_path
        fill_in 'plan_title',with: 'kome'
        fill_in 'plan_content',with: 'kk'
        select '2022', from: 'plan_start_time_1i'
        select '8月', from: 'plan_start_time_2i'
        select '1', from: 'plan_start_time_3i'
        select '00', from: 'plan_start_time_4i'
        select '00', from: 'plan_start_time_5i'
        click_on 'commit'
        find('.rspec').click
        expect(page).to have_content 'kome'
      end
    end
  end
end
