class RemoveProjectsTicketsTable < ActiveRecord::Migration
  def change
    drop_table :projects_tickets
  end
end
