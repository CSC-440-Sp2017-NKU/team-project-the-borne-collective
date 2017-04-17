class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def management
    render html: "hello, world!"
  end
end
