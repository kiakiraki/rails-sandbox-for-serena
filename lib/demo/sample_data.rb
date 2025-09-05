# frozen_string_literal: true

module Demo
  # SampleData: Utilities for seeding, cleaning, and reporting sample data
  module SampleData
    module_function

    def create_sample_data
      Rails.logger.debug 'Creating sample data...'

      users = create_users(10)
      posts = create_posts(users)
      comments = create_comments(posts, users)

      Rails.logger.debug { "\nCreated #{users.count} users" }
      Rails.logger.debug { "Created #{posts.count} posts" }
      Rails.logger.debug { "Created #{comments.count} comments" }
      Rails.logger.debug 'Sample data creation completed!'
    end

    def clean_sample_data
      Rails.logger.debug 'Cleaning up sample data...'

      Comment.destroy_all
      Rails.logger.debug 'Deleted all comments'

      Post.destroy_all
      Rails.logger.debug 'Deleted all posts'

      User.destroy_all
      Rails.logger.debug 'Deleted all users'

      Rails.logger.debug 'Sample data cleanup completed!'
    end

    def stats_output
      Rails.logger.debug '=== Database Statistics ==='
      print_user_stats
      print_post_stats
      print_comment_stats
    end

    def print_user_stats
      Rails.logger.debug { "Users: #{User.count}" }
      Rails.logger.debug { "  - Adults: #{User.adults.count}" }
      Rails.logger.debug { "  - Minors: #{User.where('age < 18').count}" }
      Rails.logger.debug ''
    end

    def print_post_stats
      Rails.logger.debug { "Posts: #{Post.count}" }
      Rails.logger.debug { "  - Published: #{Post.published.count}" }
      Rails.logger.debug { "  - Draft: #{Post.draft.count}" }
      Rails.logger.debug { "  - Archived: #{Post.archived.count}" }
      Rails.logger.debug ''
    end

    def print_comment_stats
      Rails.logger.debug { "Comments: #{Comment.count}" }
      Rails.logger.debug { "  - Approved: #{Comment.approved.count}" }
      Rails.logger.debug { "  - Pending: #{Comment.pending.count}" }
      Rails.logger.debug { "  - Rejected: #{Comment.rejected.count}" }
    end

    def create_users(count)
      (1..count).map do |i|
        user = User.create!(
          name: "User #{i}",
          email: "user#{i}@example.com",
          age: rand(18..65)
        )
        Rails.logger.debug '.'
        user
      end
    end

    def create_posts(users)
      users.flat_map do |user|
        Array.new(rand(1..5)) do |index|
          post = user.posts.create!(post_attrs(user, index))
          Rails.logger.debug '.'
          post
        end
      end
    end

    def create_comments(posts, users)
      posts.flat_map do |post|
        Array.new(rand(0..8)) do
          comment = post.comments.create!(comment_attrs(users: users))
          Rails.logger.debug '.'
          comment
        end
      end
    end

    def post_attrs(user, index)
      {
        title: "Sample Post #{index + 1} by #{user.name}",
        content: "This is the content of post #{index + 1} by #{user.name}. " * rand(10..50),
        status: %w[draft published archived].sample
      }
    end

    def comment_attrs(users:)
      {
        content: 'This is a sample comment. ' * rand(1..5),
        user: users.sample,
        status: %w[pending approved rejected].sample
      }
    end
  end
end
