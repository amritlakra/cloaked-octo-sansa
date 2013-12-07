class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :gid
      t.string :gname

      t.timestamps
    end
  end
end
