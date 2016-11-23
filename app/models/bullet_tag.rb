class BulletTag < ApplicationRecord
  # Direct associations

  validates :tag_id, :uniqueness => { :scope => [:bullet_id]}
  belongs_to :tag

  belongs_to :bullet

  # Indirect associations

  # Validations

end
