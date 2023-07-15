class CreatePersonalComputerRamMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_computer_ram_memories do |t|
      t.bigint :personal_computer_id
      t.bigint :ram_memory_id

      t.timestamps
    end
  end
end
