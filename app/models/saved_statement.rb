class SavedStatement < ApplicationRecord
  # Direct associations

  belongs_to :resume

  belongs_to :statement

  # Indirect associations

  # Validations

end
