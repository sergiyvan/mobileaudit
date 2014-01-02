class Payout < ActiveRecord::Base
	has_many :task_instances
	has_many :tasks, through: :task_instances
	belongs_to :user

end
