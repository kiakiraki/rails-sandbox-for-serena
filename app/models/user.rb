# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, presence: true, numericality: { greater_than: 0, less_than: 150 }

  scope :adults, -> { where("age >= ?", 18) }
  scope :by_name, ->(name) { where("name ILIKE ?", "%#{name}%") }

  def full_display_name
    "#{name} (#{email})"
  end

  def adult?
    age >= 18
  end

  def recent_posts(limit = 5)
    posts.order(created_at: :desc).limit(limit)
  end

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end