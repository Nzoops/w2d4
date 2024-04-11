require 'nokogiri'
require 'open-uri'
require 'pry'

def get_townhall_email(townhall_url) #Fetch the name and email from the city specifc page based on the URL of this given page
    page = Nokogiri::HTML(URI.open(townhall_url))
        
        #rescue.is_empty
         #   puts "the show is finished, exit through the backdoor"
        #end
        name = []
        email = []
        name = page.css('h1').map(&:text)
        #puts name
        email = page.css('.infos__item.-email a').map(&:text)
        #puts email
        city_hash = Hash[name.zip(email)]
        puts city_hash
end

#url = "https://www.aude.fr/annuaire-mairies-du-departement/mairie-aigues-vives"
#get_townhall_email(url)

def get_townhall_urls
    page = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))
    
    url_suffix = page.css('.directory-block__img-link.composite-link').map { |link| link['href'] }
    #print url_suffix

    url_total = []
    url_suffix.each do |iterate|
        url_total << "https://www.aude.fr#{iterate}"
    end
    url_total
    
end

def mother_flecker_scrapper_articulator
    final_list = []
    get_townhall_urls.each do |url|
        final_list << get_townhall_email(url)
    end
    final_list
end

final_list = mother_flecker_scrapper_articulator
puts final_list



# ARCHIVE
#def city_halls_finder
pages = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))
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