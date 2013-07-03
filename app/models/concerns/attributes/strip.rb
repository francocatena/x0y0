module Attributes::Strip
  extend ActiveSupport::Concern

  module ClassMethods
    def strip_fields *fields
      before_validation do |model|
        fields.each do |n|
          model[n] = model[n].strip if model[n].respond_to? 'strip'
        end
      end
    end
  end
end
