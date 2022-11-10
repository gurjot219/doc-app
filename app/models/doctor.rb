class Doctor < ApplicationRecord
  has_one_attached :image
  belongs_to :speciality

  after_create :create_users

  def create_users
    User.create(first_name: first_name, last_name: last_name, email: email, password: password)
  end

end
