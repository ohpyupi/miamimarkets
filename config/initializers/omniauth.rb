OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 146984498970959, '8d421dfa9f234b030f69a05714d3481a'
end
