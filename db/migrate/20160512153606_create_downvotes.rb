class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer :filosofer_id
      t.references :downvotable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
