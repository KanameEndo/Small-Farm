require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'コンタクトモデル機能', type: :model do
    context '名前が空の場合' do
      it 'バリデーションエラー(nameのNil制約)となり失敗する' do
        empty_name = FactoryBot.build(:contact, name: nil)
        expect(empty_name).not_to be_valid
      end
    end
    context 'emailが空の場合' do
      it 'バリデーションエラー(emailのNil制約)となり失敗する' do
        empty_email = FactoryBot.build(:contact, email: nil)
        expect(empty_email).not_to be_valid
      end
    end
    context 'emailの形式が異なる場合' do
      it 'バリデーションエラー(emailのフォーマット制限)となり失敗する' do
        different_types_email = FactoryBot.build(:contact, email: 'email.com')
        expect(different_types_email).not_to be_valid
      end
    end
    context 'messageが空の場合' do
      it 'バリデーションエラー(messageのNil制約)となり失敗する' do
        empty_message = FactoryBot.build(:contact, message: nil)
        expect(empty_message).not_to be_valid
      end
    end
  end
end
