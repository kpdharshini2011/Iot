class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.datetime :temp_time
      t.float :celcius
      t.float :farenhiet

      t.timestamps
    end
  end
end
