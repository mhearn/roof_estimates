class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :shingle_type
      t.integer :shingle_quantity
      t.integer :estimate_id

      t.timestamps
    end
  end
end
