class Doctor < ApplicationRecord
  has_one_attached :image
  belongs_to :speciality
end
