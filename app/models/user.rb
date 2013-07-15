class User < ActiveRecord::Base
  include Attributes::Strip
  include Attributes::Downcase
  include Users::Authentication
  include Users::Overrides
  include Users::PasswordReset
  include Users::Validation

  strip_fields :name, :lastname, :email
  downcase_fields :email
end
