class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :priority
      t.references :user, null: false, foreign_key: true
       # t.references :assigner, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
