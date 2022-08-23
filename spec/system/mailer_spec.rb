require 'rails_helper'

RSpec.describe "Mailer", type: :system do
  let!(:contact){ Contact.create(name: "endo", email: "endo@example.com", message: "届きました")}
  let(:mail) { ContactMailer.contact_mail(contact).deliver }
  let(:check_sent_mail) {
    expect(mail.present?).to be_truthy, 'メールが送信されていません'
    expect(mail.to).to eq(['endo@example.com']), 'メールの送信先が正しくありません'
    expect(mail.subject).to eq('お問い合わせの確認メール'), 'メールのタイトルが正しくありません'
  }
  
  describe 'メールの送信' do
    context 'メールを送信した場合' do
      it 'タイトル、メールアドレスが正しく送信される' do
        check_sent_mail
      end
    end
  end
end