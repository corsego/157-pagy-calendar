class CreateDateAvatars < ActiveRecord::Migration[7.1]
  def change
    create_table :date_avatars do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
