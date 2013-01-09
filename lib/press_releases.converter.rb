# script to convert press releases from et-model database to yaml files.
# usage:
# > ruby press_releases.converter.rb press_releases.json
# To unload press releases from rails:
# > a = PressRelease.all
# > File.open('press_releases.json', 'w') { |f| f.write("#{a.to_json}")}
require "yaml"
require "json"

class PressRelease
  attr_accessor :title, :medium, :release_type, :file_name, :release_date, :key
  def initialize(title, medium, release_type, file_name, release_date, key)
    @title = title
    @medium = medium
    @release_type = release_type
    @file_name = file_name
    @release_date = release_date
    @key = key
  end
  
end

file = ARGV[0]
content = JSON.parse(IO.read(file))
press_releases = []
content.each  do |press|
  press_releases << PressRelease.new(
    press['press_release']['title'],
    press['press_release']['medium'],
    if press['press_release']['release_type'].empty?
      'undefined'
    else
      press['press_release']['release_type']
    end,
    if press['press_release']['link'].split('/')[1] == 'media'
      press['press_release']['link'].split('/')[2].tr(' ', '_').gsub(/[\(\)]/, '').tr('-', '_')
    else
      press['press_release']['link']
    end,
    press['press_release']['release_date'].split('T')[0],
    press['press_release']['release_date'].split('T')[0] + '_' + press['press_release']['medium'].split('.')[0].gsub(/\W/, '').downcase
  )
end

press_releases.each do |press|
  contents = "#{press.to_yaml.lines.to_a[1..-1].join}"
  File.open("press_releases/#{press.key}.yml", 'w') { |f| f.write(contents)}
end
puts "Saved #{press_releases.length} press releases."
