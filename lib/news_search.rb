require 'dotenv/load'
require 'net/http'
require 'json'


module NewsKernel

  def headline(news_item)
    news_item["fields"]["headline"]
  end

  def published?(news_item)
    format(news_item["webPublicationDate"][0...-4])
  end

  def thumbnail(news_item)
    news_item['fields']['thumbnail']
  end

  def category(news_item)
    news_item['sectionName']
  end

  def author(news_item)
    news_item["fields"]["byline"]
  end

  def link(news_item)
    news_item["webUrl"]
  end

  def format(date)
    date = DateTime.parse(date)
    formatted_date = date.strftime("%d-%m-%Y")
    formatted_date
  end

end


class News

include NewsKernel

API_KEY = ENV['GUARDIAN_API_KEY']
GUARDIAN_URL = "https://content.guardianapis.com/search?q=%<query>s&query-fields=headline&show-fields=thumbnail,headline,byline&order-by=newest&api-key=#{API_KEY}"

 def initialize(query, connector = Net::HTTP)
   @query = query
   @url = GUARDIAN_URL % {query: query} 
   @connector = connector
 end

 attr_reader :url, :query, :connector

 def something(nice)
  headline(nice)
 end


   def results_only
     make_call_to_api["response"]["results"]
   end

   def make_call_to_api
     response = connector.get(URI(url))
     return JSON.parse(response)
   end

end
