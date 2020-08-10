class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :category
      t.string :region
      t.string :department

      t.timestamps
    end
  end
end
