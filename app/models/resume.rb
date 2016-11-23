class Resume < ApplicationRecord
  # Direct associations

  has_many   :saved_statements,
             :dependent => :destroy

  has_many   :saved_bullets,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :statements,
             :through => :saved_statements,
             :source => :statement

  has_many   :bullets,
             :through => :saved_bullets,
             :source => :bullet

  # Validations

end
