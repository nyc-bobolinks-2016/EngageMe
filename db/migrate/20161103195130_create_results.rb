class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.decimal :anger, null: false, default: 0
      t.decimal :contempt, null: false, default: 0
      t.decimal :disgust, null: false, default: 0
      t.decimal :fear, null: false, default: 0
      t.decimal :happiness, null: false, default: 0
      t.decimal :neutral, null: false
      t.decimal :sadness, null: false, default: 0
      t.decimal :surprise, null: false, default: 0
      t.references :presentation, index: true

      t.timestamps(null: false)
    end
  end
end
