class CreateEventTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :event_tickets do |t|
      t.string :event_name
      t.belongs_to :user, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
