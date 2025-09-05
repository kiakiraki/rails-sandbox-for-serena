# frozen_string_literal: true

# UserService: User-related operations and orchestration
class UserService
  class << self
    def create_with_welcome_post(user_params)
      ActiveRecord::Base.transaction do
        user = User.create!(user_params)
        create_welcome_post(user)
        send_welcome_email(user)
        user
      end
    rescue ActiveRecord::RecordInvalid => e
      raise CreateUserError, e.message
    end

    def bulk_update_status(user_ids, status)
      users = User.where(id: user_ids)
      return { success: false, message: 'No users found' } if users.empty?

      updated_count = update_users_status(users, status)

      { success: true, message: "Updated #{updated_count} users", updated_count: updated_count }
    end

    def search_users(query, filters = {})
      scope = User.all

      scope = scope.by_name(query) if query.present?
      scope = scope.adults if filters[:adults_only]
      scope = scope.where(age: (filters[:min_age])..) if filters[:min_age]
      scope = scope.where(age: ..(filters[:max_age])) if filters[:max_age]

      scope.includes(:posts).order(:name)
    end

    private

    def create_welcome_post(user)
      user.posts.create!(
        title: 'Welcome to the platform!',
        content: "Hi #{user.name}, welcome to our platform. We're excited to have you here!",
        status: 'published'
      )
    end

    def send_welcome_email(user)
      # In a real app, this would queue an email job
      Rails.logger.info "Sending welcome email to #{user.email}"
    end

    def update_users_status(users, status)
      updated_count = 0
      User.transaction do
        users.find_each do |user|
          updated_count += 1 if user.update(status: status)
        end
      end
      updated_count
    end
  end

  class CreateUserError < StandardError; end
end
