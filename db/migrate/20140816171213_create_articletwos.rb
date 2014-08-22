class CreateArticletwos < ActiveRecord::Migration
  def change
    create_table :articletwos do |t|
      t.string :key
      t.text :value
      t.references :article, index: true

      t.timestamps
    end
  end
end
