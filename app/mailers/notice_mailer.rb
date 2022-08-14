class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_food.subject
  #
  default from: 'uchiyama.farmhosoe@gmail.com'
  def sendmail_food(food)
    @food = food

    mail to: 'hogehoge@gmail.com', subject: '【内山農園より】収穫日のお知らせ'
  end
end
