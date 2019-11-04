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
    # Print the ENV variable
    p ENV

    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
