# OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :soundcloud, 'acd16bcf56239ce99f23d068b98e1a76','acae685a59a3ecd3a9f478d98656e5b5', {:client_options => {:ssl => {:ca_path => '/usr/local/etc/openssl/certs'}}}
end