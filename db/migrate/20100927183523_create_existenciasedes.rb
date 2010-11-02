class CreateExistenciasedes < ActiveRecord::Migration
  def self.up
    create_table :existenciasedes do |t|
      t.integer :cantidad
      t.integer :sede_id
      t.integer :existencia_id

      t.timestamps
    end
  end

  def self.down
    drop_table :existenciasedes
  end
end
