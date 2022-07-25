class CreatePolymorphicLike < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.bigint "user_id", null: false
      t.bigint "likeable_id", null: false
      t.string "likeable_type"

      t.timestamps
    end
    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true
    add_index :likes, [:likeable_id, :likeable_type]
  end
end
