class Patient < ApplicationRecord
  has_one_attached :image
  has_many :appointments
  has_many :doctors, through: :appountments

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  after_create :create_users

  def create_users
    User.create(first_name: first_name, last_name: last_name, email: email, password: password, role: "patient")
  end
end
