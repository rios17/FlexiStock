class CreateContactos < ActiveRecord::Migration
  def self.up
    create_table :contactos do |t|
      t.string :descripcion
      t.string :tipo_contacto
      t.integer :cliente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contactos
  end
end
