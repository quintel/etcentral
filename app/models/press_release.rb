class PressRelease < YmlReadOnlyRecord
  attr_accessor :id, :medium, :release_type, :release_date, :link, :title, :key

  def <=>(other_press_release)
    self.release_date <=> other_press_release.release_date
  end

  def self.find_by_id(id)
    self.all.select { |press| press.id === id.to_i }.first
  end

  #######
  private
  #######

  def details
    YAML.load_file("#{Rails.root}/config/pressreleases/#{self.key}.yml") 
    rescue Errno::ENOENT
      puts 'No file found'
  end

end

#add press_release_path(id)