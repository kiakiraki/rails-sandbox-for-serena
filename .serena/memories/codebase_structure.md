# Codebase Structure and Architecture

## Directory Structure

```
ruby-lsp-sandbox/
├── app/
│   ├── controllers/           # Rails controllers
│   │   ├── api/v1/           # API versioning namespace
│   │   ├── application_controller.rb
│   │   ├── users_controller.rb
│   │   └── posts_controller.rb
│   ├── models/               # ActiveRecord models
│   │   ├── application_record.rb
│   │   ├── user.rb
│   │   ├── post.rb
│   │   └── comment.rb
│   ├── helpers/              # View helpers
│   │   ├── application_helper.rb
│   │   └── users_helper.rb
│   ├── services/             # Service objects
│   │   └── user_service.rb
│   └── views/                # View templates (if any)
├── config/                   # Rails configuration
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
│   ├── features/
│   ├── spec_helper.rb
│   └── rails_helper.rb
├── db/                       # Database files
├── Gemfile                   # Gem dependencies
└── README.md
```

## Key Components

### Models
- **User**: Core user model with validations, associations, and scopes
  - Associations: has_many posts, comments
  - Validations: name, email, age
  - Scopes: adults, by_name
  - Methods: full_display_name, adult?, recent_posts

- **Post**: Content model with enum status
  - Belongs to User
  - Has many Comments
  - Status enum: draft, published, archived

- **Comment**: User-generated content
  - Belongs to User and Post
  - Status tracking: pending, approved, rejected

### Controllers
- **ApplicationController**: Base controller
- **UsersController**: User management
- **PostsController**: Post management
- **Api::V1::BaseController**: API base controller
- **Api::V1::UsersController**: API user endpoints

### Services
- **UserService**: Business logic for user operations
- Encapsulates complex user-related operations
- Keeps controllers thin

### Testing Structure
- **Factories**: FactoryBot definitions for test data
- **Model specs**: Unit tests for models
- **Controller specs**: Controller behavior tests
- **Feature specs**: Integration tests

## Design Patterns Used

### Rails Conventions
- Follow Rails MVC pattern
- RESTful routing and controller actions
- ActiveRecord for ORM

### Service Objects
- Extract complex business logic from controllers
- Single responsibility principle
- Testable and reusable components

### API Versioning
- Namespace API controllers under Api::V1
- Allows for future API evolution

### Factory Pattern (Testing)
- FactoryBot for test data creation
- Separate concerns from test logic

## Code Organization Principles

### Separation of Concerns
- Models handle data and business rules
- Controllers handle HTTP requests/responses
- Services handle complex business logic
- Helpers handle view-related utilities

### Convention over Configuration
- Follow Rails naming conventions
- Use Rails generators patterns
- Standard directory structure

### Test-Driven Development Ready
- Comprehensive test structure
- Factory-based test data
- Isolated unit and integration tests