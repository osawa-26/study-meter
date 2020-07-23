# class Admin::AppUserForm
#   include ActiveModel::Model
#
#   attr_accessor :app_user
#   delegate :persisted?, :save, to: :app_user
#
#   def initialize(app_user = AppUser.find(params[:id]))
#     @app_user = app_user
#   end
#
#   def assign_attributes(params = {})
#     @params = params
#     app_user.assign_attributes(app_user_params)
#   end
#
#   private def app_user_params
#     @params.require(:app_user).permit(
#       :email,
#       :family_name,
#       :given_name,
#       :family_name_kana,
#       :given_name_kana,
#       :nickname,
#       :gender,
#       :birthday,
#       :prefecture,
#       :target,
#       :password,
#       :start_date,
#       :end_date,
#       :suspended
#     )
#   end
# end
