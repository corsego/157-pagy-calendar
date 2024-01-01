class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :start_date

      t.timestamps
    end
  end
end
