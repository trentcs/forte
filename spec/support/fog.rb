Fog.mock!
# Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')
connection = Fog::Storage.new(:provider => 'AWS', 
															:aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'], 
															:aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'])
connection.directories.create(:key => ENV['AWS_BUCKET'])
