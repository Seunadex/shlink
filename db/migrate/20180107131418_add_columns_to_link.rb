class AddColumnsToLink < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :snapshot, :string
    add_column :links, :title, :string
  end
end
