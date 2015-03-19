class TwilioGateway

  def send_sms(*args)
    options = args.extract_options!
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
    client.account.sms.messages.create(
      from: options[:from],
      to:   options[:to],
      body: options[:body]
    )
  end

end
