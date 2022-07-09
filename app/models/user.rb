class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #User name NOT NULL
  
  validates :user_name, presence: true
  #A User(Teacher) creates many courses, within those courses, he/she can create many excursions.
  has_many :excursions, through: :courses

  # A User(Student) can enroll into many courses.
  # While a course can accept many students. Thus it is a many to many.
  has_many :enrollments
  has_many :courses, through: :enrollments

  
  #A user can join/enlist into many excursions.
  #While an excursion can accept many users
  #Thus a many-to-many relationship.
  has_many :enlistments
  has_many :excursions, through: :enlistments

  # A driver(User) can create many groups
  has_many :groups

  #A user can upload a profile photo of themselves.
  has_one_attached :image

end
