module Users::Overrides
  extend ActiveSupport::Concern

  def to_s
    [name, lastname].join(' ')
  end
end
