== About This Application

This app was born from my personal struggle using Google to find specific
reaction gifs. Really I just want to drop a couple keywords, tags even,
into a search box and get the gif I was looking for.

I wrote this with Ruby 2.1.2 and PostgreSQL as the DB, you'll need them
both. Previous versions of Ruby will likely work, though untested for now.

* How to run the test suite
bundle exec rspec

Installing/Running
------------------
Clone the repository to your machine and change into the directory.
```bash
git clone https://github.com/jtperreault/gif_app.git && cd gif\_app
```

Install the required Ruby gems.
```ruby
bundle install
```

Copy/Rename the application's config and edit with your credentials.
```bash
cp config/application.example.yml config/application.yml
vim config/application.yml
```

Create the Database
```ruby
rake db:create
```

Load the DB schema
```ruby
rake db:schema:load
```

Seed the Database. This will pull your information from application.yml,
be sure you've edited it with your credentials!
```ruby
rake db:seed
```

Start the development server
```ruby
rails server
```

Visit localhost:3000 to ensure it's running.

Running the Test Suite
----------------------

You can run the test suite on your local machine with this command
```ruby
bundle exec rspec
```

