class Statement < ApplicationRecord
  # Direct associations

  has_many   :saved_statements,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :resumes,
             :through => :saved_statements,
             :source => :resume

  # Validations

end
