class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.string :description
      t.date :date_define
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
