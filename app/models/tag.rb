class Tag < ApplicationRecord
  # Direct associations

  has_many   :bullet_tags,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
