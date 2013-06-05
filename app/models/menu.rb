class Menu

  class << self

    def items
      YAML.load_file(File.join(Rails.root),'config','menu.yml')
    end

  end

end
