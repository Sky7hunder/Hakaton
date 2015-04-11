class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :link, null: false, default: ""

      t.timestamps null: false
    end
  end
end
