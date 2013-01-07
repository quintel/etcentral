# converter from json to yaml for partners
# it expects json file as a second argument
# example, ruby convert.rb partners.json
# to unload data from rails:
# > p = Partner.group(:name)
# > File.open('partners.json', 'w') {|f| f.write(a.to_json(include: :description))}

require 'json'
require 'yaml'

class Partner
  attr_accessor :key, :url, :country, :type, :description_en, :description_nl

  def initialize (key, url, country, type, description_en, description_nl)
    @key = key
    @url = url
    @country = country
    @type = type
    @description_en = description_en
    @description_nl = description_nl
  end

end

file = ARGV[0]
content = JSON.parse(IO.read(file))
partners = []
content.each do |item|
    partners << Partner.new(
      item['partner']['name'].downcase.tr(" ", "_"),
      item['partner']['url'],
      item['partner']['country'].gsub(/<\/?[^>]*>/, ""),
      item['partner']['partner_type'],
      if item['partner']['description']
          item['partner']['description']['short_content_en'].gsub(/<\/?[^>]*>/, "")
      else
        'no description'
      end,
      if item['partner']['description']
        item['partner']['description']['short_content_nl'].gsub(/<\/?[^>]*>/, "")
      else
        'geen beschrijving'
      end
    )

end

partners.each do |partner|
  File.open("partners/#{partner.key}.yml", 'w') { |f| f.write("#{partner.to_yaml.lines.to_a[1..-1].join}") }
end
