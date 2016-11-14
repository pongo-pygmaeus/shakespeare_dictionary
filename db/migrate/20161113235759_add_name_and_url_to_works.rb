class AddNameAndUrlToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :name, :string
    add_column :works, :url, :string
  end
end
