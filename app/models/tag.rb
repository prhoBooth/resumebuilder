class Tag < ApplicationRecord
  # Direct associations

  has_many   :bullet_tags,
             :dependent => :destroy

  # Indirect associations

  has_many   :bullets,
             :through => :bullet_tags,
             :source => :bullet

  # Validations

end
