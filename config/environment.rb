# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ci5644AbrJul2013::Application.initialize!
Rails.logger = Logger.new(STDOUT)
