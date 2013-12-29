class TaskInstance < ActiveRecord::Base
	belongs_to :task
	belongs_to :user
	serialize :content

	def finish
		self.update(status: :finished)
		agent = self.user
		agent.update(credit: self.param(:price)+agent.credit, exp: self.param(:expirience)+agent.exp)
	end

	def param(param)
		return self.task.attributes if param == 'all'
		return self.task.attributes[param]
	end
end
