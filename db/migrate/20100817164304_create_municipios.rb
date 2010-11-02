class CreateMunicipios < ActiveRecord::Migration
  def self.up
    create_table :municipios do |t|
      t.string :name
      t.integer :departamento_id

      t.timestamps
    end
  end

  def self.down
    drop_table :municipios
  end
end
