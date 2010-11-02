class CreateTiposMovimientos < ActiveRecord::Migration
  def self.up
    create_table :tipos_movimientos do |t|
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos_movimientos
  end
end
