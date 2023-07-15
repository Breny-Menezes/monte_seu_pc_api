class CreateProcessingUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :processing_units do |t|
      t.string :description
      t.integer :brand

      t.timestamps
    end
  end
end
