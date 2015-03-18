class CreatePulses < ActiveRecord::Migration
  def change
    create_table :pulses do |t|
      t.integer :pulse_rate
      t.datetime :pulse_time

      t.timestamps
    end
  end
end
