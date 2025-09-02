# frozen_string_literal: true

module ApplicationHelper
  def page_title(title = nil)
    base_title = "Ruby LSP Sandbox"
    return base_title if title.blank?

    "#{title} | #{base_title}"
  end

  def format_date(date)
    return "N/A" if date.blank?

    date.strftime("%B %d, %Y")
  end

  def format_datetime(datetime)
    return "N/A" if datetime.blank?

    datetime.strftime("%B %d, %Y at %I:%M %p")
  end

  def truncate_html(text, length = 150)
    return "" if text.blank?

    truncate(strip_tags(text), length: length)
  end

  def status_badge(status)
    case status.to_s
    when "published", "approved"
      content_tag :span, status.humanize, class: "badge badge-success"
    when "draft", "pending"
      content_tag :span, status.humanize, class: "badge badge-warning"
    when "archived", "rejected"
      content_tag :span, status.humanize, class: "badge badge-danger"
    else
      content_tag :span, status.humanize, class: "badge badge-secondary"
    end
  end

  def gravatar_url(email, size = 80)
    hash = Digest::MD5.hexdigest(email.downcase.strip)
    "https://www.gravatar.com/avatar/#{hash}?s=#{size}&d=identicon"
  end
end