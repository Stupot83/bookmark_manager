# frozen_string_literal: true

require_relative './database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end
