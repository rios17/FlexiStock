class CreateMovimientosInventarios < ActiveRecord::Migration
  def self.up
    create_table :movimientos_inventarios do |t|
      t.integer :cantidad
      t.datetime :fecha
      t.integer :tipo_movimiento_id
      t.integer :articulo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movimientos_inventarios
  end
end
