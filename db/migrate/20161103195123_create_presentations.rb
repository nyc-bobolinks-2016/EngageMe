class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :audience, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :time_taken, default: 0, null: false
      t.text :notes
      t.boolean :finished, null: false, default: false
      t.references :user, index: true

      t.timestamps(null: false)
    end
  end
end
