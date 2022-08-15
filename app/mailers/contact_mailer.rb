class ContactMailer < ApplicationMailer

  default from: 'uchiyama.farmhosoe@gmail.com'
  default to: 'uchiyama.travail@gmail.com'
  layout 'mailer'

  def contact_mail(contact)
    @contact = contact
    mail to:   ENV['MAIL_ADDRESS'], subject: '【お問い合わせ】'
  end
end
