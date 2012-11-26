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
#  partner_type     :string(255)      default("general")
#

class Partner < YmlReadOnlyRecord
  attr_accessor :name, :url, :country, :time, :repeat_any_other, :subheader, :place, :long_name, :partner_type, :description, :short_description

  ##
  # TODO: Handle the case when a partner has strange characters in the name.
  #       It's probably easiest to add a new attribute 'slug' to partners that
  #       holds a url suitable name.
  #
  def self.find_by_slug(name)
    find_by_name(name.to_s)
  end

  def self.find_by_name(name)
    self.all.select {|p| p.name.downcase == name.downcase}.first
  end

  def description?
    self.description
  end

  def name_or_long_name
    self.long_name ? self.long_name : self.name
  end

  def logo
    "/assets/partners/#{name.downcase.gsub(' ', '_')}.png"
  end

  def footer_logo
    "/assets/partners/#{name.downcase.gsub(' ', '_')}-inner.png"
  end

  def link
    has_local_page? ? "/partners/#{name.downcase}" : url
  end

  # Returns true if we have a local page about the partner
  def has_local_page?
    self.description && self.description.content.present?
  end
end
