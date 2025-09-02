# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true, length: { minimum: 5, maximum: 500 }
  validates :status, inclusion: { in: %w[pending approved rejected] }

  scope :approved, -> { where(status: "approved") }
  scope :recent, -> { order(created_at: :desc) }

  enum status: { pending: 0, approved: 1, rejected: 2 }

  def approved?
    status == "approved"
  end

  def can_be_moderated_by?(user)
    post.user == user
  end
end