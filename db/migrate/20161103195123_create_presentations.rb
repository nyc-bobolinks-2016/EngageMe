class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :audience, null: false
      t.datetime :date_given, null: false
      t.interval :time_allotted, null: false
      t.text :notes, null: false
      t.references :user, index: true

      t.timestamps(null: false)
    end
  end
end
