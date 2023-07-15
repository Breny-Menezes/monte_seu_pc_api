class CreateMotherboards < ActiveRecord::Migration[5.2]
  def change
    create_table :motherboards do |t|
      t.string :description
      t.integer :supported_processing_unit
      t.integer :available_ram_slots
      t.integer :max_ram_supported
      t.boolean :integrated_video_card

      t.timestamps
    end
  end
end
