class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :rut
      t.string :name
      t.integer :resolve_number
      t.date :resolve_date
      t.string :mail
      t.string :url

      t.timestamps null: false
    end
  end
end
