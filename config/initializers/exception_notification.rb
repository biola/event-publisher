if defined? ::ExceptionNotifier
  EventPublisher::Application.config.middleware.use ExceptionNotification::Rack,
    email: {
      email_prefix: '[event_publisher] ',
      sender_address: Settings.email.from,
      exception_recipients: Settings.exceptions.mail_to
    }
end
