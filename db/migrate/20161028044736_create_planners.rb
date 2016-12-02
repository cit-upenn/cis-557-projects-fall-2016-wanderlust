class CreatePlanners < ActiveRecord::Migration
  def change
    create_table :planners do |t|
      t.string :location
      t.string :miles

      t.timestamps null: false
    end
  end
end
