admin_email = YAML.load_file("#{RAILS_ROOT}/config/settings.yml")[Rails.env]['admin_email']
ExceptionNotifier.exception_recipients = admin_email