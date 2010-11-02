class CreateCaracteristicas < ActiveRecord::Migration
  def self.up
    create_table :caracteristicas do |t|
      t.string :marca
      t.string :codigo_barras
      t.string :peso_articulo
      t.string :talla
      t.string :lote
      t.string :ubicacion
      t.string :descripcion
      t.integer :articulo_id
      t.integer :color_id

      t.timestamps
    end
  end

  def self.down
    drop_table :caracteristicas
  end
end
