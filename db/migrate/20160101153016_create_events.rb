class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :organization_id
      t.string :category, array: true, default: []
      t.string :title
      t.boolean :date_type
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :num_of_volunteer
      t.date :dateline
      t.string :requirements
      t.timestamps null: false
    end
  end
end
