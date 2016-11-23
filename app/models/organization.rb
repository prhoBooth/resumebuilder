class Organization < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :bullets,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
