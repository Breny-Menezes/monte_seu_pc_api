class CreateAssemblyPcRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :assembly_pc_requests do |t|
      t.string :customer_name
      t.string :customer_document

      t.timestamps
    end
  end
end
