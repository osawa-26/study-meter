require "rails_helper"

describe User::Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      m = build(:app_user)
      expect(User::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "誤ったパスワードならfalseを返す" do
      m = build(:app_user)
      expect(User::Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    example "パスワード未設定ならfalseを返す" do
      m = build(:app_user, password: nil)
      expect(User::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    example "停止フラグが立っていてもtrueを返す" do
      m = build(:app_user, suspended: true)
      expect(User::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "開始前ならfalseを返す" do
      m = build(:app_user, start_date: Date.tomorrow)
      expect(User::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "終了後ならfalseを返す" do
      m = build(:app_user, end_date: Date.today)
      expect(User::Authenticator.new(m).authenticate("pw")).to be_falsey
    end
  end
end
