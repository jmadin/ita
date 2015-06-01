# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
Ita::Application.initialize!

Time::DATE_FORMATS[:ita_date] = "%e %B %Y"
