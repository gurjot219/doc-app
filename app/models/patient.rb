class Patient < ApplicationRecord
  has_one_attached :image
  has_many :appointments
  has_many :doctors, through: :appountments

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

end
