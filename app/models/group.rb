class Group < ApplicationRecord
  belongs_to :user
  belongs_to :excursion

  has_many :passengers

  has_one_attached :image

end
