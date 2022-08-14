class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email, subject: "お問い合わせの確認メール"
  end

  # def send_mail(contact)
  #   @contact = contact
  #   mail to:   ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n
  # end
end
