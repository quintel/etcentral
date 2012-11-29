class PressRelease < YmlReadOnlyRecord
  attr_accessor :id, :medium, :release_type, :release_date, :file_name, 
                :title

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
    YAML.load_file("#{Rails.root}/config/press_releases/#{self.key}.yml") 
    rescue Errno::ENOENT
      # TODO: Dangerous! don't leave this error unnoticed!
      puts 'No file found'
  end

end
