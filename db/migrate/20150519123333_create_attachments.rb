class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :attachedfile
      t.belongs_to :ticket, index: true
      t.string :filetype
      t.timestamps null: false
    end
    
    add_foreign_key :tickets, :attachment
  end
end
