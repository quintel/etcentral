class PressRelease < YmlReadOnlyRecord
  attr_accessor :key, :medium, :release_type, :release_date, :file_name,
                :title

  def <=>(other_press_release)
    self.release_date <=> other_press_release.release_date
  end

  def self.find_by_key(key)
    self.all.select { |press| press.key === key }.first
  end


end
