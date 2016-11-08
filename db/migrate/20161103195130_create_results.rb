class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.decimal :anger, null: false
      t.decimal :contempt, null: false
      t.decimal :disgust, null: false
      t.decimal :fear, null: false
      t.decimal :happiness, null: false
      t.decimal :neutral, null: false
      t.decimal :sadness, null: false
      t.decimal :surprise, null: false
      t.references :presentation, index: true

      t.timestamps(null: false)
    end
  end
end
