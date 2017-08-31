module AuthenticationHelper
  private
  def authenticate
    authenticate_or_request_with_http_basic do |id, pass|
      id == ENV['ADMIN_USER'] && pass == ENV['ADMIN_PASS']
    end
  end
end
