class User < ApplicationRecord
  # Direct associations

  has_many   :organizations,
             :dependent => :destroy

  has_many   :bullets,
             :dependent => :destroy

  has_many   :resumes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
