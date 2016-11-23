class Bullet < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :saved_bullets,
             :dependent => :destroy

  has_many   :bullet_tags,
             :dependent => :destroy

  belongs_to :organization

  # Indirect associations

  has_many   :resumes,
             :through => :saved_bullets,
             :source => :resume

  has_many   :tags,
             :through => :bullet_tags,
             :source => :tag

  # Validations

end
