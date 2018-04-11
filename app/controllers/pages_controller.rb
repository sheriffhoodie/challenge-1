class PagesController < JSONAPI::ResourceController
  def index
    @pages = Page.all
    render :index
  end

  def create
    title = params[:title]
    @url = params[:url]
    @pages = []
    @pages << Page.new(title, @url)

    if @url
      require 'open-uri'
      document = Nokogiri::HTML(open(@url, :allow_redirections => :all))
      @h1s = document.search('h1')
      @h2s = document.search('h2')
      @h3s = document.search('h3')
      @links = document.search('a')
      @links_arr = []
      @links.each do |link|
        link_url = link['href']
        @links_arr << link_url
      end
      render :create
    end

  end

end
