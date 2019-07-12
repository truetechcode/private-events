class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :venue
      t.text :description
      t.timestamp :date

      t.timestamps
    end
  end
end
