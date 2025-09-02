# Ruby LSP Sandbox

A comprehensive Ruby on Rails template project for testing Ruby Language Server (ruby-lsp) functionality.

## Project Structure

```
ruby-lsp-sandbox/
├── app/
│   ├── controllers/           # Rails controllers
│   │   ├── api/v1/           # API controllers
│   │   ├── application_controller.rb
│   │   ├── users_controller.rb
│   │   └── posts_controller.rb
│   ├── models/               # ActiveRecord models
│   │   ├── application_record.rb
│   │   ├── user.rb
│   │   ├── post.rb
│   │   └── comment.rb
│   ├── helpers/              # Helper methods
│   │   ├── application_helper.rb
│   │   └── users_helper.rb
│   └── services/             # Service classes
│       └── user_service.rb
├── config/                   # Configuration files
│   ├── application.rb
│   ├── boot.rb
│   ├── routes.rb
│   ├── database.yml
│   └── initializers/
├── lib/                      # Library code
│   ├── ruby_lsp_sandbox.rb
│   └── tasks/
│       └── demo.rake
├── spec/                     # RSpec tests
│   ├── models/
│   ├── controllers/
│   ├── factories/
│   ├── spec_helper.rb
│   └── rails_helper.rb
├── Gemfile                   # Gem dependencies
└── README.md
```

## Setup

### 1. Install Dependencies

```bash
bundle install
```

### 2. Run Tests

```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/models/user_spec.rb
```

### 3. Development Tasks

```bash
# Create sample data
bundle exec rake demo:create_sample_data

# Show database statistics
bundle exec rake demo:stats

# Clean up sample data
bundle exec rake demo:clean_sample_data
```