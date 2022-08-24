require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  describe 'お気に入り食品機能' do
    before do
      @user = FactoryBot.create(:user)
      @food = FactoryBot.create(:food, user :@user)
      #アソシエーションが組まれる↑

      visit new_session_path
      fill_in :session_email,with: 'endo00@example.com'
      fill_in :session_password,with: 'endo00'
      click_on'Log in'
    end

    context 'お気に入りに登録した場合' do
      before do
        visit divesite_path(divesite.id)
        find('.fa-meh').click
      end
      it 'フラッシュメッセージに登録したと表示される' do
        expect(page).to have_selector '.alert-info', text: 'お気に入りダイブサイトに登録しました'
      end
      it 'マイページにお気に入りにしたダイブサイト名が表示される' do
        visit mypage_user_path(user.id)
        expect(page).to have_content divesite.name
      end
    end
    context 'ダイブサイトお気に入りをはずした場合', js: true do
      before do
        visit divesite_path(divesite.id)
        find('.fa-meh').click
        find('.fa-laugh-squint').click
      end
      it 'フラッシュメッセージに削除したと表示される' do
        expect(page).to have_selector '.alert-secondary', text: 'お気に入りダイブサイトから削除しました'
      end
      it 'マイページにお気に入りから削除したダイブサイト名が表示されない' do
        visit mypage_user_path(user.id)
        expect(page).not_to have_content divesite.name
      end
    end
  end
end
