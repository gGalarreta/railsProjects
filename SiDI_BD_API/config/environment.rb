#token_app
TOKEN = "f26221474d7aa5fa355087b0bbe63b3e"

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Include your application configuration below
ActiveRecord::Base.pluralize_table_names = false
