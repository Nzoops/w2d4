require 'nokogiri'
require 'open-uri'

def crypto_scrapper

    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    puts page.class   # => Nokogiri::HTML::Document

    crypto_name = page.css(".jlJKxd .cmc-link").map { |name| name.content.strip } # map iterate then iterate over name and extract the content & remove spaces
    puts crypto_name
    
    crypto_price = page.css(".ejtlWy a.cmc-link").map { |price| price.content.strip }
    puts crypto_price
    
    crypto_hash = (crypto_name.zip(crypto_price)).to_h
    puts crypto_hash
    
    crypto_hash.map{ |k,v| "#{k} => #{v}" }.sort

    puts crypto_hash

end ruby crypto_scrapper.rb  ruby crypto_scrapper.rb 