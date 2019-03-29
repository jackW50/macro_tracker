module ApplicationHelper

  def errors_list(item)
    if item.errors.any?
      content_tag :div do
        content_tag :h2, pluralize(item.errors.count, "error")
        content_tag :ul, class: "errors" do
          item.errors.full_messages.each do |msg|
            concat(content_tag(:li, msg))
          end
        end
      end
    end
  end

  def logout_link_display?
    link_to "Logout", session_path(current_user.id), method: :delete if logged_in?
  end

  def your_profile_link_display?
    link_to "Your Profile", user_path(current_user.id), method: :get if logged_in?
  end

end
