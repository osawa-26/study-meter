class RecordFormPresenter < FormPresenter
  def study_time_block(name1, name2, label_text, choices1, choices2, options = {})
    markup(:div, class: "input-block") do |m|
      m << decorated_label(name1, label_text, options)
      m << form_builder.select(name1, choices1, { include_blank: true }, options)
      m << form_builder.select(name2, choices2, { include_blank: true }, options)
      m << error_messages_for(name1)
      m << error_messages_for(name2)
    end
  end

end
