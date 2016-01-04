class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :organization_id
      t.string :title
      t.text   :description
      t.boolean :date_type
      t.date   :start_date
      t.date   :end_date
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


