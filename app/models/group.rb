class Group < ApplicationRecord

  validates :user_id, presence: true
  validates :excursion_id, presence: true
  #A group is created by a student driver.
  #Thus it belongs to a user.
  belongs_to :user

  #A group is creates within an excursion thus it belongs to an excursion.
  belongs_to :excursion

  #many-to-many relationships
  #A group has many customers.
  has_many :passengers
  has_many :users, through: :passengers

  #photo of a car or a meeting place
  has_one_attached :image

end
