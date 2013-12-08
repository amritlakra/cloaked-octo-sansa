class AddCategoryToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :gcategory, :string
  end
end
