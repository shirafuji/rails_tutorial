module ApplicationHelper

  #ページごとのタイトルを返す
  def full_title(page_title = "")
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.blank?
      return base_title
    else
      title = page_title + " | " + base_title
      return title
    end
  end
end
