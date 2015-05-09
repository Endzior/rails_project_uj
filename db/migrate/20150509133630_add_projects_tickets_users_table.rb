class AddProjectsTicketsUsersTable < ActiveRecord::Migration
  def change
    create_table :projects_tickets, id: false do |t|
      t.belongs_to :projects, index: true
      t.belongs_to :tickets, index: true
      t.belongs_to :users
    end
  end
end
