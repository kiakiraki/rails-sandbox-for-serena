# Task Completion Workflow

## Post-Development Commands

When completing a coding task in this project, run the following commands in order:

### 1. Code Quality Checks
```bash
# Run RuboCop for code style and convention checks
bundle exec rubocop

# Auto-fix correctable issues
bundle exec rubocop -a
```

### 2. Testing
```bash
# Run full test suite to ensure no regressions
bundle exec rspec

# For specific areas, run targeted tests
bundle exec rspec spec/models/
bundle exec rspec spec/controllers/
```

### 3. Verification Steps
- Ensure all tests pass
- Verify RuboCop compliance
- Check that Ruby LSP functionality works correctly
- Manually test any new features if applicable

## Development Workflow

### Before Starting Work
1. Run `bundle install` to ensure dependencies are up to date
2. Check current code quality: `bundle exec rubocop`
3. Verify existing tests pass: `bundle exec rspec`

### During Development
1. Write tests first (TDD approach recommended)
2. Implement functionality
3. Run relevant tests frequently: `bundle exec rspec spec/path/to/specific_test.rb`

### Before Committing
1. Run full test suite: `bundle exec rspec`
2. Fix any RuboCop violations: `bundle exec rubocop -a`
3. Verify Ruby LSP features work with new code
4. Run demo tasks if data-related changes: `bundle exec rake demo:stats`

## Ruby LSP Verification Checklist

After making changes, verify these Ruby LSP features still work:
- [ ] Go to definition (F12)
- [ ] Find references (Shift + F12)
- [ ] Auto completion
- [ ] Hover information
- [ ] Symbol search (Cmd/Ctrl + Shift + O)
- [ ] Syntax highlighting
- [ ] Error diagnostics

## Common Issues and Solutions

### Bundle Issues
- If gem conflicts occur: `rm Gemfile.lock && bundle install`
- For Ruby version mismatches: Update `ruby "x.x.x"` in Gemfile

### Test Issues
- If tests fail after changes: Check factory definitions and model validations
- For RSpec configuration issues: Verify `spec_helper.rb` and `rails_helper.rb`

### RuboCop Issues
- For style violations: Run `bundle exec rubocop -a` to auto-fix
- For complex violations: Manually fix or configure exceptions in `.rubocop.yml`