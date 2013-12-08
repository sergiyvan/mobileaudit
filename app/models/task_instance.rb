class TaskInstance < ActiveRecord::Base
	belongs_to :task
	belongs_to :user

	def param(param)
		return self.task.attributes if param == 'all'
		return self.task.attributes[param]
	end
end
