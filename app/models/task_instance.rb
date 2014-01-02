class TaskInstance < ActiveRecord::Base
	belongs_to :task
	belongs_to :user
	belongs_to :payout
	serialize :content

	def finish
		self.update(status: :finished)
		agent = self.user
		agent.update(credit: self.task.price+agent.credit, exp: self.task.expirience+agent.exp)
	end

end
