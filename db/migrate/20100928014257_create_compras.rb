class CreateCompras < ActiveRecord::Migration
  def self.up
    create_table :compras do |t|
      t.date :fecha
      t.string :articulo
      t.string :cantidad
      t.string :cantidad
      t.string :precio
      t.integer :proveedor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :compras
  end
end
