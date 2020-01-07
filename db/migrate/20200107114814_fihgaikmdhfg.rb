class Fihgaikmdhfg < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :ment
    add_column :comments, :dialogue, :text
  end
end
