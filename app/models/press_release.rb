class PressRelease < YmlReadOnlyRecord
  attr_accessor :medium, :release_type, :release_date, :link, :title, :key

  def <=>(other_press_release)
    self.release_date <=> other_press_release.release_date
  end

  def link
    "public/media/" + details[:link]
  end



  private

    def details
      YAML.load_file("#{Rails.root}/config/pressreleases/#{self.key}.yml") rescue {}
    end
end