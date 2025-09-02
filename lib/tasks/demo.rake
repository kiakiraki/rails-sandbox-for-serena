# frozen_string_literal: true

namespace :demo do
  desc "Create sample data for development"
  task create_sample_data: :environment do
    puts "Creating sample data..."

    # Create users
    users = []
    10.times do |i|
      user = User.create!(
        name: "User #{i + 1}",
        email: "user#{i + 1}@example.com",
        age: rand(18..65)
      )
      users << user
      print "."
    end

    puts "\nCreated #{users.count} users"

    # Create posts
    posts = []
    users.each do |user|
      rand(1..5).times do |i|
        post = user.posts.create!(
          title: "Sample Post #{i + 1} by #{user.name}",
          content: "This is the content of post #{i + 1} by #{user.name}. " * rand(10..50),
          status: %w[draft published archived].sample
        )
        posts << post
        print "."
      end
    end

    puts "\nCreated #{posts.count} posts"

    # Create comments
    comments = []
    posts.each do |post|
      rand(0..8).times do
        comment = post.comments.create!(
          content: "This is a sample comment. " * rand(1..5),
          user: users.sample,
          status: %w[pending approved rejected].sample
        )
        comments << comment
        print "."
      end
    end

    puts "\nCreated #{comments.count} comments"
    puts "Sample data creation completed!"
  end

  desc "Clean up all sample data"
  task clean_sample_data: :environment do
    puts "Cleaning up sample data..."

    Comment.destroy_all
    puts "Deleted all comments"

    Post.destroy_all
    puts "Deleted all posts"

    User.destroy_all
    puts "Deleted all users"

    puts "Sample data cleanup completed!"
  end

  desc "Show statistics"
  task stats: :environment do
    puts "=== Database Statistics ==="
    puts "Users: #{User.count}"
    puts "  - Adults: #{User.adults.count}"
    puts "  - Minors: #{User.where('age < 18').count}"
    puts ""
    puts "Posts: #{Post.count}"
    puts "  - Published: #{Post.published.count}"
    puts "  - Draft: #{Post.draft.count}"
    puts "  - Archived: #{Post.archived.count}"
    puts ""
    puts "Comments: #{Comment.count}"
    puts "  - Approved: #{Comment.approved.count}"
    puts "  - Pending: #{Comment.pending.count}"
    puts "  - Rejected: #{Comment.rejected.count}"
  end
end