class CreateMeshesQuestions < ActiveRecord::Migration
  def self.up
    create_table :meshes_questions, :id => false do |t|
      t.integer :question_id
      t.integer :mesh_id

      t.timestamps
    end
  end

  def self.down
    drop_table :meshes_questions
  end
end
