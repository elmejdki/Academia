class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.datetime :last_message

      t.timestamps
    end
  end
end
