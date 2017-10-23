CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AKIAITD64TEG4EQLB6TQ'],
    aws_secret_access_key: ENV['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'],
    region: ENV['ap-northeast-1'],
    path_style: true
  }
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  config.remove_previously_stored_files_after_update = false
  config.fog_directory = ENV['zaiko-system']
  config.asset_host = ENV['https://s3-ap-northeast-1.amazonaws.com/zaiko-system/']
end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/