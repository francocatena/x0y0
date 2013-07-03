class User < ActiveRecord::Base
  include Attributes::Strip
  include Attributes::Downcase
  include Users::Validation

  strip_fields :name, :lastname, :email
  downcase_fields :email

  has_secure_password
end
