class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :name, null: false
      t.integer :karma, default: 0
    end

    create_table :questions do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end

    create_table :answers do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :votes, default: 0
      t.boolean :best_ans, default: false
    end
  end
end
