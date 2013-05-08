class AddThesisIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :thesis_id, :integer
  end
end
