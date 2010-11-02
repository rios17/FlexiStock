class CreateExistencias < ActiveRecord::Migration
  def self.up
    create_table :existencias do |t|
      t.integer :cantidad_disponible
      t.integer :articulo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :existencias
  end
end
