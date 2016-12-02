class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :icon
      t.string :advice

      t.timestamps null: false
    end
  end
end
