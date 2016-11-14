class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :html
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
