class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  protect_from_forgery with: :exception

  class Page
    def initialize(title, link)
      @title = title
      @link = link
    end
    attr_reader :title
    attr_reader :link
  end

  def scrape_page
    require 'open-uri'
    document = Nokogiri::HTML(open("https://www.reddit.com/"))
    @h1s = document.search('h1')
    @h2s = document.search('h2')
    @h3s = document.search('h3')
    @links = document.search('a')
    @links_arr = []
    @links.each do |link|
      link_url = link['href']
      @links_arr << link_url
    end

    render template: 'scrape_page'
  end
end
