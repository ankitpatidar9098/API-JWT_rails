class Task < ApplicationRecord
  
   belongs_to :assigner, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  #belongs_to :assigner, class_name: 'User', optional: true  # The user who assigned the task
end
