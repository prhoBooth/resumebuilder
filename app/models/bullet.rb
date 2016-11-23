class Bullet < ApplicationRecord
  # Direct associations

  has_many   :bullet_tags,
             :dependent => :destroy

  belongs_to :organization

  # Indirect associations

  # Validations

end
