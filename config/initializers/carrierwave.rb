if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: AWS_KEY,
      aws_secret_access_key: AWS_SECRET
    }
    config.storage = :fog
    config.fog_directory  = 'savorlystatic'
  end
end

# Reduces the quality of the image to the percentage given
def quality(percentage)
  manipulate! do |img|
    img.write(current_path){ self.quality = percentage }
    img = yield(img) if block_given?
    img
  end
end