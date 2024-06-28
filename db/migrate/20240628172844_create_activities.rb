class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :address
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :category

      t.timestamps
    end
  end
end
