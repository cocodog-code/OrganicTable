module ApplicationHelper
  def full_title(page_title: '')
    if page_title.empty?
      Constants::BASE_TITLE_NAME
    else
      "#{page_title} | #{Constants::BASE_TITLE_NAME}"
    end
  end
end
