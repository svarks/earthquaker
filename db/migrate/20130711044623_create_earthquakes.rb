class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.string    :source_id, null: false
      t.string    :src, null: false
      t.integer   :version
      t.datetime  :datetime
      t.float     :lat
      t.float     :lon
      t.float     :magnitude
      t.float     :depth
      t.integer   :nst
      t.string    :region

      t.timestamps
    end

    add_index :earthquakes, :source_id, unique: true
  end
end
