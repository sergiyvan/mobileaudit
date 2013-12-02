class Task < ActiveRecord::Base
	has_many :task_instances, dependent: :destroy
end
