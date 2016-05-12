class CreateFilosofers < ActiveRecord::Migration
  def change
    create_table :filosofers do |t|
      t.string :first_name, :last_name, :username, :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
