class Changecol1231 < ActiveRecord::Migration[6.0]
  def change
    def change
      remove_column :comments, :ment
      add_column :comments, :dialogue, :text
    end
  end
end
