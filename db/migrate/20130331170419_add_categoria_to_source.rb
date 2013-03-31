class AddCategoriaToSource < ActiveRecord::Migration
  def change
    add_column :sources, :category, :string
  end
end
