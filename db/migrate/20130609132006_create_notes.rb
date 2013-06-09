class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :winner
      t.integer :steps

      t.timestamps
    end
  end
end
