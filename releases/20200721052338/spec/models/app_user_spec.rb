require 'rails_helper'

RSpec.describe AppUser, type: :model do
  describe "#password=" do
    example "文字列を与えると、hashed_passwordは長さ60の文字列になる" do
      appuser = AppUser.new
      appuser.password = "studystudy"
      expect(appuser.hashed_password).to be_kind_of(String)
      expect(appuser.hashed_password.size).to eq(60)
    end

    example "nilを与えると、hashed_passwordはnilになる" do
      appuser = AppUser.new(hashed_password: "x")
      appuser.password = nil
      expect(appuser.hashed_password).to be_nil
    end
  end
end
