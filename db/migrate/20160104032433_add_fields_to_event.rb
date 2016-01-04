class AddFieldsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :arts_and_culture, :boolean, :default => false
    add_column :events, :sports, :boolean, :default => false
    add_column :events, :animals, :boolean, :default => false
    add_column :events, :technology, :boolean, :default => false
    add_column :events, :education, :boolean, :default => false
    add_column :events, :children_and_youth, :boolean, :default => false
    add_column :events, :community, :boolean, :default => false
    add_column :events, :environment, :boolean, :default => false
    add_column :events, :homeless_and_housing, :boolean, :default => false
    add_column :events, :women, :boolean, :default => false
    add_column :events, :seniors, :boolean, :default => false
    add_column :events, :disaster_relief, :boolean, :default => false
    add_column :events, :health, :boolean, :default => false
    add_column :events, :immigrants_refugees, :boolean, :default => false
    add_column :events, :special_events, :boolean, :default => false 
  end
end