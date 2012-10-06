module MailChecker
  class Mail < ActiveResource::Base
    self.element_name = 'message'

    [:element_path, :new_element_path, :collection_path].each do |method|
      define_singleton_method method do |*args|
        super(*args).gsub(/\.#{format.extension}/, '')
      end
    end

    def self.destroy_all
      connection.delete(collection_path)
    end

    def self.any?(&block)
      all.any?(&block)
    end

    def load(attributes, remove_root = false)
      super(attributes, remove_root)

      @attributes['sender'].gsub!(/[<>]/, '')
      @attributes['recipients'].map! { |r| r.gsub(/[<>]/, '') }

      self
    end
  end
end