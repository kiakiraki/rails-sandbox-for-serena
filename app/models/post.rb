# frozen_string_literal: true

# Post: Blog post authored by a user
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :status, inclusion: { in: %w[draft published archived] }

  scope :published, -> { where(status: 'published') }
  scope :by_user, ->(user) { where(user: user) }
  scope :recent, -> { order(created_at: :desc) }

  enum :status, { draft: 0, published: 1, archived: 2 }

  def published?
    status == 'published'
  end

  def word_count
    content.split.size
  end

  def reading_time
    (word_count / 200.0).ceil
  end

  def excerpt(length = 150)
    return content if content.length <= length

    "#{content[0...length]}..."
  end

  def can_be_edited_by?(user)
    self.user == user
  end
end
