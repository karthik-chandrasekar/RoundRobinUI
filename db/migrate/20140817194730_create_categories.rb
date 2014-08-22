class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :categoryname

      t.timestamps
    end
  end
end
