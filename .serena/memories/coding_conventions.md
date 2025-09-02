# Coding Conventions and Style Guide

## Ruby/Rails Conventions

### File Headers
- All Ruby files use `# frozen_string_literal: true` at the top

### Class Structure
- Models inherit from `ApplicationRecord`
- Controllers inherit from `ApplicationController` or `Api::V1::BaseController` for API endpoints
- Follow standard Rails naming conventions

### Model Patterns
Example from User model:
- Associations declared first
- Validations after associations
- Scopes after validations
- Public methods before private methods
- Use `dependent: :destroy` for associations

### Method Naming
- Predicate methods end with `?` (e.g., `adult?`)
- Private methods are clearly separated
- Use descriptive method names

### Validation Patterns
- Presence validations with specific constraints
- Use Rails validators (length, numericality, format)
- Custom format validation using regex (e.g., EMAIL_REGEXP)

### Code Organization
- Service objects in `app/services/` for complex business logic
- Helpers for view-related utilities
- Custom Rake tasks in `lib/tasks/`

## Testing Conventions

### RSpec Configuration
- Use modern RSpec configuration (no monkey patching)
- Random test order with seed
- Example status persistence
- Profile slowest examples (10)
- Focus filtering enabled

### Test Structure
- Factory files in `spec/factories/`
- Model specs in `spec/models/`
- Controller specs in `spec/controllers/`
- Feature specs in `spec/features/`

## Code Quality Tools
- **RuboCop**: Available but no configuration file present
- **Ruby LSP**: Integrated for development experience
- Uses standard Rails/Ruby conventions when no custom rules specified