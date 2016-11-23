class BulletTag < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :bullet

  # Indirect associations

  # Validations

end
