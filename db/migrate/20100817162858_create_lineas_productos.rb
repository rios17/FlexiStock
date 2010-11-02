class CreateLineasProductos < ActiveRecord::Migration
  def self.up
    create_table :lineas_productos do |t|
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :lineas_productos
  end
end
