class CreateRamMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :ram_memories do |t|
      t.string :description
      t.integer :size

      t.timestamps
    end
  end
end
