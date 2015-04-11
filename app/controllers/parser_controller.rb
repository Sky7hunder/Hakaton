class ParserController < ApplicationController

  require 'rubygems'
  # для получения контента через http
  require 'open-uri'

  # подключаем Nokogiri
  require 'nokogiri'

  def show

  end

  def gamebomb
    # Parse the URI and retrieve it to a temporary file
    news_tmp_file = open('http://gamebomb.ru/')

    # Parse the contents of the temporary file as HTML
    @doc = Nokogiri::HTML(news_tmp_file)

    # Define the css selectors to be used for extractions, most
    @article_css_class         =".items-list .gbnews-listShort"
    @article_date_css_class    =".sub"
    @article_header_css_class  ="h3"
    @article_text_css_class    ="p"
    @main_menu_elements_css_class ="#header-menu .main-menu li"
    @main_menu_links_css_class ="a"
=begin
    # extract all the categories
    categories = doc.css(main_menu_elements_css_class)



    #html output
    html = ""

    #extract the title from the articles
    categories.each do |category|
      link = category.css(main_menu_links_css_class)

      # since there are multiple titles for each entry on google news
      # for this demo we only want the first (topmost)
      #
      # its very easy to do, since title_nodes is of type NodeSet which implements Enumerable (http://ruby-doc.org/core-2.0.0/Enumerable.html)
      # > title_nodes.class
      #  => Nokogiri::XML::NodeSet
      # > title_nodes.class.ancestors
      #   => [Nokogiri::XML::NodeSet, Enumerable, Object, Kernel, BasicObject]

      ## prime_title = title_nodes.first


      # Even when the css selector returns only one element, its type is also Nokogiri::XML::NodeSet
      ## summary_node = article.css(article_summary_css_class)

      # > summary_node.class
      #  => Nokogiri::XML::NodeSet
      # > summary_node.size
      #  => 1

      # Create an "---------" line for the title
      separator = "-" * link.text.size

      # Extracting the text from an Nokogiri::XML::Element is easy by calling the #text method,
      # notice how we can also do it on the NodeSet,
      # there it as a different semantic by invoking #text in all the children nodes
       html += "%s\n%s" % [link.text, separator]
    end

    #___________________ARTICLES_______________________________

    # extract all the articles
    articles = doc.css(article_css_class)

    #extract the title from the articles
    articles.each do |article|
      article_date = article.css(article_date_css_class)
      article_head = article.css(article_header_css_class)
      article_text = article.css(article_text_css_class)

      # since there are multiple titles for each entry on google news
      # for this demo we only want the first (topmost)
      #
      # its very easy to do, since title_nodes is of type NodeSet which implements Enumerable (http://ruby-doc.org/core-2.0.0/Enumerable.html)
      # > title_nodes.class
      #  => Nokogiri::XML::NodeSet
      # > title_nodes.class.ancestors
      #   => [Nokogiri::XML::NodeSet, Enumerable, Object, Kernel, BasicObject]

      ## prime_title = title_nodes.first


      # Even when the css selector returns only one element, its type is also Nokogiri::XML::NodeSet
      ## summary_node = article.css(article_summary_css_class)

      # > summary_node.class
      #  => Nokogiri::XML::NodeSet
      # > summary_node.size
      #  => 1

      # Create an "---------" line for the title
      separator = "-" * article_head.text.size

      # Extracting the text from an Nokogiri::XML::Element is easy by calling the #text method,
      # notice how we can also do it on the NodeSet,
      # there it as a different semantic by invoking #text in all the children nodes
      html += "\n%s\n%s%s%s\n" % [article_date.text, article_head.text, article_text.text, separator ]
    end

    render :html => html
=end
  end
end
