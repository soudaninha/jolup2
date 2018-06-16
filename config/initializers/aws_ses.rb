creds = Aws::Credentials.new("#{ENV['AWS_ACCESS_KEY_ID']}", "#{ENV['AWS_SECRET_ACCESS_KEY']}") # 아마존 인증 키
Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: creds, region: 'us-west-2')
