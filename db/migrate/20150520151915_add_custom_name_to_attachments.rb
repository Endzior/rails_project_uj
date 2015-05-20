class AddCustomNameToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :customname, :string
  end
end
