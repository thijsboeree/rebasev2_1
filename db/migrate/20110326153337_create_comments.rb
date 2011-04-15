class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :text
			t.boolean :is_public

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
