class CreateAvailResources < ActiveRecord::Migration
  def change
    create_table :avail_resources do |t|
      t.text :key
      t.text :value

      t.timestamps
    end
  end
end
