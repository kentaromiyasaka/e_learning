class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :action_type
      t.references :action, polymorphic: true, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
