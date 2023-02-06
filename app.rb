require 'dotenv/load'
require 'net/http'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/news_search.rb'

class Application < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @query = params[:content] || "news"
    @news = News.new(@query) if @query
    erb :index
  end

end
