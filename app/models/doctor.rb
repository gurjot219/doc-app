class Doctor < ApplicationRecord
  has_one_attached :image
  belongs_to :speciality
  has_many :appointments

  has_many :patients, through: :appountments

  # scope :owner, -> { where(first_name: "Gurjot1") }

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  after_create :create_users

  def create_users
    User.create(first_name: first_name, last_name: last_name, email: email, password: password, role: "doctor")
  end


  def self.owner
      where(first_name: "Gurjot1")
  end
end
