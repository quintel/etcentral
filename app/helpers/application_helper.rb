module ApplicationHelper
  def english?
    I18n.locale == :en
  end
end
