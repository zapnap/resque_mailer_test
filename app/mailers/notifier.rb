class Notifier < ApplicationMailer
  include Resque::Mailer

  # @queue = 'testx'

  def test(data={})
    data.symbolize_keys!

    Rails.logger.info "sending test mail"
    Rails.logger.info "params: #{data.keys.join(',')}"
    Rails.logger.info ""

    @subject = data[:subject] || "Testing mail"
    @widget = data[:widget]
    mail(to: "nap@galaga.localdomain",
         from: "nap@galaga.localdomain",
         content_type: "text/html",
         body: "Widget name is \"#{@widget.try(:name)}\"",
         subject: @subject)
  end
end
