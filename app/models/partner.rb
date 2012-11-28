# == Schema Information
#
# Table name: partners
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  url              :string(255)
#  country          :string(255)
#  time             :integer
#  repeat_any_other :boolean          default(FALSE)
#  subheader        :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  place            :string(255)      default("right")
#  long_name        :string(255)
#  !!partner_type     :string(255)      default("general")
#

class Partner < YmlReadOnlyRecord
  attr_accessor :name, :url, :country, :time, :repeat_any_other, :subheader, :place, :long_name, :partner_type, :short_content_en, :short_content_nl

  ##
  # TODO: Handle the case when a partner has strange characters in the name.
  #       It's probably easiest to add a new attribute 'slug' to partners that
  #       holds a url suitable name.
  #
  
  def self.find_by_name(name)
    self.all.select {|p| p.name.to_s.downcase == name.downcase}.first
  end

  def name_or_long_name
    self.long_name ? self.long_name : self.name
  end

  def logo
    "/assets/partners/#{name.downcase.gsub(' ', '_')}.png"
  end

  def short_content
    t :short_content
  end

  def t(attr_name)
    lang = I18n.locale.to_s.split('-').first 
    send("#{attr_name}_#{lang}").andand.html_safe
  end

end