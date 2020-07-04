class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  included ErrorHandlers

  private def set_layout
    if params[:controller].match(%r{\A(user|admin)/})
      Regexp.last_match[1]
    else
      "user"
    end
  end
end
