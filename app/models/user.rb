class User < ApplicationRecord
  has_secure_password
  #mount_uploader :avatar, AvatarUploader
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  
  enum role: { emp: 0, admin: 1}
  validates :role, inclusion: { in: roles.keys }
   has_many :tasks ,dependent: :destroy
    has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assigner_id'
  has_many :received_tasks, class_name: 'Task', foreign_key: 'assignee_id'
end
