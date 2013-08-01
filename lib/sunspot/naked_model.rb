module Sunspot
  module NakedModel
    def self.included(base)
      base.class_eval do
        include Sunspot::Rails::Searchable
        # extend Sunspot::Rails::Searchable::ActsAsMethods
        Sunspot::Adapters::DataAccessor.register(DataAccessor, base)
        Sunspot::Adapters::InstanceAdapter.register(InstanceAdapter, base)
      
        def self.logger; ::Rails.logger; end
        def self.before_save(callback); end
        def self.after_save(callback); end
        def self.after_destroy; end
        def self.find_in_batches(opts={})
          yield all
        end
      
      end
    end
  
    class InstanceAdapter < Sunspot::Adapters::InstanceAdapter
      def id
        "#{@instance.key}:#{@instance.lang}"
      end
    end

    class DataAccessor < Sunspot::Adapters::DataAccessor
      def load(id)
        key, lang = id.split(':')
        @clazz.find(key, lang)
      end

      def load_all(ids)
        ids.map { |id| load(id) }
      end
    end  
  end
end