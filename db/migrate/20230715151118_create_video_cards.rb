class CreateVideoCards < ActiveRecord::Migration[5.2]
  def change
    create_table :video_cards do |t|
      t.string :description

      t.timestamps
    end
  end
end
