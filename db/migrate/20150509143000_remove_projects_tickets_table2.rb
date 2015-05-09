class RemoveProjectsTicketsTable2 < ActiveRecord::Migration
  def change
    drop_table :projects_tickets
  end
end
