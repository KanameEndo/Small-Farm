require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能・管理画面テスト', type: :system do

  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
  end

  describe 'ユーザ登録のテスト' do
    context 'ユーザ新規登録' do
      it '新規登録ができる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'endo'
        fill_in 'user[email]', with: 'endo@example.com'
        fill_in 'user[password]', with: 'endoendo'
        fill_in 'user[password_confirmation]', with: 'endoendo'
        click_on 'アカウント登録'
        expect(page).to have_content "登録"
      end
    end
  end

  describe 'セッションログイン機能テスト' do
    before do
      visit user_session_path
      fill_in 'user[email]', with: 'endo00@example.com'
      fill_in 'user[password]', with:'endo00'
      click_on 'commit'
    end

    context 'ログインした場合' do
      it 'フードの詳細画面に飛べること' do
        visit user_path(@user.id)
        expect(current_path).to eq user_path(id: @user.id)
      end
    end

    context 'ログアウトした場合' do
      it "フード一覧画面に戻る" do
        visit foods_path
        click_on "ログアウト"
        expect(page).to have_content "ログアウト"
      end
    end
  end

  describe "管理画面のテスト" do
    context "一般ユーザーがログインしている場合" do
      it "一般ユーザーは管理画面にはアクセスできない" do
        visit user_session_path
        fill_in "user[email]", with: "endo26@example.com​"
        fill_in "user[password]", with: "endo26"
        click_on "commit"
        visit plans_path
        expect(foods_path).to eq current_path(user)
      end
    end

    describe 'マイページ機能' do
      before do
        visit user_session_path
        fill_in 'user[email]', with: 'endo00@example.com'
        fill_in 'user[password]', with:'endo00'
        click_on 'commit'
      end
  
      context 'マイページにアクセスすると' do
        it '名前とマイアドレスが確認できる' do
          visit users_show_path
          expect(page).to have_content "endo00"
          expect(page).to have_content "endo00@example.com"
        end
      end
  
      context 'マイページにアクセスすると' do
        it "プロフィールを編集できる" do
          visit users_show_path
          click_on "プロフィール編集"
          visit edit_user_path
          expect(page).to have_content "編集"
          click_on "保存"
        end
      end
    end
  end
end
