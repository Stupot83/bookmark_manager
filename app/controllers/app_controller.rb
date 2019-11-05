# frozen_string_literal: true

require 'sinatra/base'
require_relative '../models/bookmark.rb'
require_relative '../controllers/database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

# The BookmarkManager class
class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/new' do
    flash[:notice] = 'You must submit a valid URL.' unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end
