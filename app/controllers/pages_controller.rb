class PagesController < JSONAPI::ResourceController
  def index
    @pages = Page.all
    render :index
  end

  def create
    title = params[:title]
    @url = params[:url]
    page = Page.new(page_params)
    page.save

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

    end
    render template: 'pages/home'
  end

  def page_params
    params.fetch(:page, Hash.new).permit(:title, :url)
  end

end
