CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AKIAJDILXOFM47UZDBYQ'],
    aws_secret_access_key: ENV['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'],
    region: ENV['ap-northeast-1'],
    path_style: true
  }
  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  config.remove_previously_stored_files_after_update = false
  config.fog_directory = ENV['zaiko-system']
  config.asset_host = ENV['zaiko-system']
end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/