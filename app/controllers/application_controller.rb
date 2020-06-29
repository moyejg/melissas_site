class ApplicationController < ActionController::Base
  helper_method :resource_name, :resource, :devise_mapping, :resource_class, :mobile?

def resource_name
  :user
end
 
def resource
  @resource ||= User.new
end

def resource_class
  User
end
 
def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
end

private

def mobile? # has to be in here because it has access to "request"
  request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
end

end
