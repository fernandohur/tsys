class AddStuffToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :state, :string
    add_column :activities, :desc, :string
  end
end
