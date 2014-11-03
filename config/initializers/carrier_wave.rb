if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJ6VNLEKUBC2PSZOA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['smatt989eventapp']
  end
end