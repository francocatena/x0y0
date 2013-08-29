module Users::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :lastname, presence: true
    validates :name, :lastname, :email, length: { maximum: 255 }
    validates :email,
      uniqueness: { case_sensitive: false },
      presence: true,
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  end
end
