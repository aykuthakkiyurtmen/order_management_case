class Form < ApplicationRecord

  def self.name_pattern
    /\A[^0-9`!@#\$%\^&*+_=]+\z/
  end
end
