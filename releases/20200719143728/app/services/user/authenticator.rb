class User::Authenticator
  def initialize(app_user)
    @app_user = app_user
  end

  def authenticate(raw_password)
    @app_user &&
      @app_user.hashed_password &&
      @app_user.start_date <= Date.today &&
      (@app_user.end_date.nil? || @app_user.end_date > Date.today) &&
      BCrypt::Password.new(@app_user.hashed_password) == raw_password
  end
end
