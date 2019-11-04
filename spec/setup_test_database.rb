# frozen_string_literal: true

require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clean the bookmarks table
  connection.exec('TRUNCATE bookmarks;')
end
