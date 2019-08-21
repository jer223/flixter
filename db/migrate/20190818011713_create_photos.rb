class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :caption

      t.timestamps
    end

    add_index :photos 
  end
end
