class CreateDespachos < ActiveRecord::Migration
  def self.up
    create_table :despachos do |t|
      t.integer :cantidad
      t.datetime :fecha_despacho
      t.integer :cliente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :despachos
  end
end
