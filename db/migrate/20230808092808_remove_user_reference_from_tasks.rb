class RemoveUserReferenceFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :tasks, :user, foreign_key: true
  end
end
