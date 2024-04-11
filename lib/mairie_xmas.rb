require 'nokogiri'
require 'open-uri'
require 'pry'

def get_townhall_email(townhall_url) #Fetch the name and email from the city specifc page based on the URL of this given page
    page = Nokogiri::HTML(URI.open(townhall_url))
        
        name = []
        email = []
        name = page.css('h1').map(&:text) #- get the name of the townhall, method uses map as content/text only work for strings #print name
        email = page.css('.infos__item.-email a').map(&:text) #get the email of the townhall #print email
        city_hash = Hash[name.zip(email)] #unify it into one single hash #puts city_hash
        puts city_hash
end

def get_townhall_urls
    page = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))
    
    url_suffix = page.css('.directory-block__img-link.composite-link').map { |link| link['href'] } #fetch the link using map as .content or .text only work with strings #print url_suffix

    url_total = []
    url_suffix.each do |iterate| #iterate on the suffixes 
        url_total << "https://www.aude.fr#{iterate}" #for each suffix add the prefix to create a complete email
    end
    url_total
    
end

def mother_flecker_scrapper_articulator
    final_list = []
    get_townhall_urls.each do |url| # for all urls listed
        final_list << get_townhall_email(url) #add the result of the get_townhall_email method to the final list
    end
end

mother_flecker_scrapper_articulator

# ARCHIVE
#def city_halls_finder
#pages = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))
#
 #       name_array = pages.css(".directory-block__title").text.split
  #      email_array = pages.css("p.-email a").text.split
   #     puts email_array
    #    puts "----------------------------------------------------------"
     #   puts name_array

        #hash_name_email = (name_array).zip(email_array).to_h
        #puts hash_name_email
   
#end 

#city_halls_finder()