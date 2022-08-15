class ContactMailer < ApplicationMailer

  default from: 'uchiyama.farmhosoe@gmail.com'
  default to: 'uchiyama.travail@gmail.com'
  layout 'mailer'

  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email, subject: "お問い合わせの確認メール"
  end
end
