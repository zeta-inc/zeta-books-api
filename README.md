# Zeta Books API

## Installation

- `bundle install`
- `cp config/database.yml.sqlite3 config/database.yml`
- `bundle exec rake db:setup`
- `bundle exec rake db:migrate`
- Yahoooooooo!

## Running

- `bundle exec rails server`

## Tests

- Run all tests `bundle exec rake test`
- Run specific test script `bundle exec rake test <test file.rb>`
- Run specific test in specific script `bundle exec rake test <test file.rb> <test name>`

## REPL console

`bundle exec rails console`

## Routes

List all routes, according to `config/routes.rb`

`bundle install rake routes`
