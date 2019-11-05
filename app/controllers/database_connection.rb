# frozen_string_literal: true

require 'pg'

# The DatabaseConnection class
class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
