class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.float :raiting
      t.integer :user_id
      t.integer :booking_id

      t.timestamps
    end
  end
end
