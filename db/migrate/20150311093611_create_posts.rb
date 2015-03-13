class CreatePosts < ActiveRecord::Migration
  def change
     create_table :posts do |t|
      t.belongs_to :user

      t.string :name, null: false
      t.string :location, null: false
      t.string :crime, null: false
      t.string :bounty, null: false
      t.string :pic_url, null: false
      t.string :tagline, null: false

      t.timestamps
    end
  end
end
