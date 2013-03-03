class RemoveDirFromSource < ActiveRecord::Migration
  def up
     remove_column :sources, :dir
  end

  def down
    add_column :sources, :dir, :string
  end
end
