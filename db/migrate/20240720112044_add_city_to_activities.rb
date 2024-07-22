class AddCityToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :city, :string
  end
end
