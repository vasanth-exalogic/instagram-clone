class Changecol1231243 < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :comment
    add_column :comments, :ment, :text
  end
end
