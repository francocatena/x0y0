module Attributes::Downcase
  extend ActiveSupport::Concern

  module ClassMethods
    def downcase_fields *fields
      before_validation do |model|
        fields.each do |n|
          model[n] = model[n].downcase if model[n].respond_to? 'downcase'
        end
      end
    end
  end
end
