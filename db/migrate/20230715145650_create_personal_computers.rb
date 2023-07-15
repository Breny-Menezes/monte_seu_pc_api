class CreatePersonalComputers < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_computers do |t|
      t.bigint :assembly_pc_request_id
      t.bigint :motherboard_id
      t.bigint :processing_unit_id
      t.bigint :video_card_id

      t.timestamps
    end
  end
end
