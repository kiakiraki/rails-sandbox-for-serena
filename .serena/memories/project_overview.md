# Ruby LSP Sandbox Project Overview

## Project Purpose
Ruby LSP Sandbox is a comprehensive Ruby/Ruby on Rails template project designed for testing and demonstrating Ruby Language Server (ruby-lsp) functionality. This project serves as a learning and testing environment for Ruby LSP features including:

- Syntax highlighting and code formatting
- Go to definition and find references
- Auto completion and IntelliSense
- Code analysis and diagnostics
- Refactoring capabilities

## Tech Stack

### Core Framework
- **Ruby**: 3.2.2
- **Rails**: ~> 7.0.0
- **Database**: SQLite3 (~> 1.4)
- **Web Server**: Puma (~> 5.0)

### Key Gems
- **Authentication**: Devise
- **Testing**: RSpec Rails, FactoryBot Rails, Faker
- **Background Jobs**: Sidekiq
- **Pagination**: Kaminari
- **Asset Pipeline**: SASSC Rails, Image Processing
- **API**: JBuilder
- **Code Quality**: RuboCop (with Rails and RSpec extensions)
- **Development**: Ruby LSP, Web Console, Listen, Spring

### Testing Framework
- **RSpec**: BDD-style testing
- **FactoryBot**: Test data factories
- **Faker**: Fake data generation
- **Shoulda Matchers**: Rails-specific matchers
- **Capybara**: Integration testing
- **Selenium WebDriver**: Browser automation

## Project Structure
- `app/models/`: ActiveRecord models (User, Post, Comment)
- `app/controllers/`: Rails controllers including API namespace
- `app/services/`: Service objects for business logic
- `app/helpers/`: View helpers
- `spec/`: RSpec test suite
- `lib/tasks/`: Custom Rake tasks
- `config/`: Rails configuration files