class User < ActiveRecord::Base
  include Attributes::Strip
  include Attributes::Downcase

  strip_fields :name, :lastname, :email
  downcase_fields :email

  has_secure_password

  validates :name, :lastname, presence: true
  validates :email,
    uniqueness: { case_sensitive: false },
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
