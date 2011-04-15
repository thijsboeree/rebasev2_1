class CreateMeshes < ActiveRecord::Migration
  def self.up
    create_table :meshes do |t|
      t.string :description
      t.integer :synonym_id

      t.timestamps
    end
  end

  def self.down
    drop_table :meshes
  end
end
