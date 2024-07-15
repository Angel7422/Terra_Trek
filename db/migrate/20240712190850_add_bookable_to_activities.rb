class AddBookableToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :bookable, :boolean, default: false
  end
end
