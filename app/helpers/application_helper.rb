module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} | study-meter"
    else
      "study-meter"
    end
  end
end
