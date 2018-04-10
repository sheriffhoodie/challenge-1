class ApplicationController < ActionController::Base
  # include JSONAPI::ActsAsResourceController
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

    pages = document.css('.entry')
    @pages_arr = []
    pages.each do |entry|
      title = entry.css('p.title>a').text
      link = entry.css('p.title>a')[0]['href']
      @pages_arr << Page.new(title, link)
    end

    render template: 'scrape_page'
  end
end
