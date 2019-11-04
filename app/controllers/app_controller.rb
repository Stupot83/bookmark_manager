# frozen_string_literal: true

require 'sinatra/base'
require_relative '../models/bookmark.rb'
# The BookmarkManager class
class BookmarkManager < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
