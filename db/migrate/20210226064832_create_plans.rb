class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.text       :text,    null: false
      t.date       :date,    null: false
      t.references :user,   null: false,foreign_key: true
      t.integer    :part_id, null: false
      t.timestamps
    end
  end
end


