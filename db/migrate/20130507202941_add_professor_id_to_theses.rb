class AddProfessorIdToTheses < ActiveRecord::Migration
  def change
    add_column :theses, :professor_id, :integer
  end
end
