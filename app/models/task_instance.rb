class TaskInstance < ActiveRecord::Base
	belongs_to :task

	def param(param)
		return self.task.attributes if param == 'all'
		return self.task.attributes[param]
	end
end
