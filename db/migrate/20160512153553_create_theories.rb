class CreateTheories < ActiveRecord::Migration
  def change
    create_table :theories do |t|
      t.string :body
      t.boolean :best_theory
      t.integer :filosofer_id
      t.integer :pondering_id

      t.timestamps null: false
    end
  end
end
