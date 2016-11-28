class DropPlanners < ActiveRecord::Migration
  def up
    drop_table :planners
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
