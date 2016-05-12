class CreatePonderings < ActiveRecord::Migration
  def change
    create_table :ponderings do |t|
      t.string :body
      t.integer :filosofer_id

      t.timestamps null: false
    end
  end
end
