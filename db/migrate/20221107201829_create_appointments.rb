class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.datetime :start_time
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
