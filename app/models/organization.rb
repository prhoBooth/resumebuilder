class Organization < ApplicationRecord
  # Direct associations

  has_many   :bullets,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
