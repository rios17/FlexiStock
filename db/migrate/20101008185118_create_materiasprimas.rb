class CreateMateriasprimas < ActiveRecord::Migration
  def self.up
    create_table :materiasprimas do |t|
      t.string :material
      t.integer :articulo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :materiasprimas
  end
end
