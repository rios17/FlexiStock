class CreateColores < ActiveRecord::Migration
  def self.up
    create_table :colores do |t|
      t.string :tipo_color

      t.timestamps
    end
  end

  def self.down
    drop_table :colores
  end
end
