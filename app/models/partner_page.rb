class PartnerPage < Page

  class << self

    def path(key, lang)
      "#{ Rails.root }/config/partners/#{ lang }/#{ key }.markdown"
    end

  end

end
