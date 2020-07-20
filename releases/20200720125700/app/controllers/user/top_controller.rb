class User::TopController < User::Base
  skip_before_action :authorize

  def index
    if current_app_user
      render template: "user/toppages/index"
    else
      render action: "index"
    end
  end
end
