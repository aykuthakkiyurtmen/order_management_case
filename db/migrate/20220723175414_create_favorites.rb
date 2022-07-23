class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :store, null: true, foreign_key: true
      t.references :product, null: true, foreign_key: true
      t.timestamps
    end
  end
end
