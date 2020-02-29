require 'aws-sdk'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_credentials = {
      access_key_id:     ENV['S3_KEY'],
      secret_access_key: ENV['S3_SECRET'],
      region:                "us-west-1"
    }
    config.aws_acl    =  :public_read
    config.cache_dir  = "#{Rails.root}/tmp/uploads"
    config.aws_bucket = "new-ckeditor-demo"
  end
end