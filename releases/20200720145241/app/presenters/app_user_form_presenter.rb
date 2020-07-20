class AppUserFormPresenter < FormPresenter
  def gender_field_block
    markup(:div, class: "radio-buttons") do |m|
      m << decorated_label(:gender, "性別")
      m << radio_button(:gender, "male")
      m << label(:gender_male, "男性")
      m << radio_button(:gender, "female")
      m << label(:gender_female, "女性")
    end
  end
  
  def suspended_check_box
    markup(:div, class: "input-block") do |m|
      m << check_box(:suspended)
      m << label(:suspended, "アカウント停止")
    end
  end
end
