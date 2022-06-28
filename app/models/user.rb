class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :enrollments
  has_many :courses, through: :enrollments

  has_many :excursions, through: :courses

  has_many :enlistments
  has_many :excursions, through: :enlistments

end
