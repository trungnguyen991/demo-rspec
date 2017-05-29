class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :code
      t.string :name
      t.integer :gender
      t.date :dob
      t.string :phone_number
      t.text :address
      t.string :email
      t.timestamps
    end
  end
end
