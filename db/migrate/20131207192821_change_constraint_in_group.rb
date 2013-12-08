class ChangeConstraintInGroup < ActiveRecord::Migration
  def change
	change_column :groups, :gid, :string, :null => false
  	change_column :groups, :gcategory, :string, :null => false
  end
end
