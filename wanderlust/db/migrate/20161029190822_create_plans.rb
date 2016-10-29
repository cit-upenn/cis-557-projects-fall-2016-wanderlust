class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :city
      t.string :state
      t.integer :miles

      t.timestamps null: false
    end
  end
end
