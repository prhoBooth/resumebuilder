class SavedBullet < ApplicationRecord
  # Direct associations

  belongs_to :resume

  belongs_to :bullets,
             :foreign_key => "bullet_id"

  # Indirect associations

  # Validations

end
