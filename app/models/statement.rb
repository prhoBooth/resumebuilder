class Statement < ApplicationRecord
  # Direct associations

  has_many   :saved_statements,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
