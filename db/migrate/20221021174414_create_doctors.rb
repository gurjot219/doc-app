class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.references :speciality, foreign_key: true
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
