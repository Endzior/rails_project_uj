class CreateTableTicketsV2 < ActiveRecord::Migration
  def change    
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.integer :difficulty
      t.integer :status
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :tickets, :project
  end
end
