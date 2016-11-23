class Resume < ApplicationRecord
  # Direct associations

  has_many   :saved_bullets,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
