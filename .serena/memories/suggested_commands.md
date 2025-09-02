# Suggested Commands for Development

## Package Management
```bash
# Install dependencies
bundle install

# Update gems
bundle update
```

## Testing Commands
```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/models/user_spec.rb

# Run tests with detailed output
bundle exec rspec --format documentation

# Run tests and show coverage
bundle exec rspec --format documentation
```

## Code Quality
```bash
# Run RuboCop linting
bundle exec rubocop

# Run RuboCop with auto-correction
bundle exec rubocop -a

# Run RuboCop for Rails-specific rules
bundle exec rubocop --require rubocop-rails

# Run RuboCop for RSpec-specific rules
bundle exec rubocop --require rubocop-rspec
```

## Development Tasks
```bash
# Create sample data for development
bundle exec rake demo:create_sample_data

# Show database statistics
bundle exec rake demo:stats

# Clean up sample data
bundle exec rake demo:clean_sample_data
```

## Database Commands (if Rails environment is set up)
```bash
# Run database migrations
bundle exec rails db:migrate

# Create database
bundle exec rails db:create

# Seed database
bundle exec rails db:seed

# Reset database
bundle exec rails db:reset
```

## Server Commands (if Rails server is configured)
```bash
# Start Rails server
bundle exec rails server

# Start with specific port
bundle exec rails server -p 3001
```

## System Commands (macOS/Darwin)
```bash
# List files and directories
ls -la

# Search for files
find . -name "*.rb"

# Search for text in files (use ripgrep if available)
grep -r "search_term" .

# Git operations
git status
git add .
git commit -m "message"
git push
```