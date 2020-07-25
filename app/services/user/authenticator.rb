class User::Authenticator
  def initialize(app_user)
    @app_user = app_user
  end

  def authenticate(raw_password)
    @app_user &&
      @app_user.hashed_password &&
      BCrypt::Password.new(@app_user.hashed_password) == raw_password
  end
end
