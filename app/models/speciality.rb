class Speciality < ApplicationRecord
  has_one_attached :image
  has_many :doctors
end
