class CreateArticulosClientes < ActiveRecord::Migration
  def self.up
    create_table :articulos_clientes do |t|
      t.integer :articulo_id
      t.integer :cliente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articulos_clientes
  end
end
