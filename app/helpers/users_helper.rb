# frozen_string_literal: true

module UsersHelper
  def user_avatar(user, size = 50)
    image_tag gravatar_url(user.email, size),
              alt: user.name,
              class: "rounded-circle",
              size: "#{size}x#{size}"
  end

  def user_age_group(user)
    case user.age
    when 0..17
      "Minor"
    when 18..29
      "Young Adult"
    when 30..49
      "Adult"
    when 50..64
      "Middle-aged"
    else
      "Senior"
    end
  end

  def user_posts_summary(user)
    published = user.posts.published.count
    total = user.posts.count

    "#{published} published / #{total} total posts"
  end

  def user_display_name_with_status(user)
    name = user.full_display_name
    status = user.adult? ? " (Adult)" : " (Minor)"
    "#{name}#{status}"
  end
end