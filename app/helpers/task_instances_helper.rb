module TaskInstancesHelper

	STATUS_AGENT = [
		"in_progress",
		"ready"
	]

	STATUS_OPERATOR = [
		"created",
		"in_progress",
		"ready",
		"done",
		"pay_out"
	]

	def can_set_status(status)
		return true if current_user.role == 'agent' && STATUS_AGENT.include?(status)
		return true if current_user.role == 'operator' && STATUS_OPERATOR.include?(status)
		return false
	end

	def user_tasks(user)
		task_instances = TaskInstance.where(user_id: user.id)
		tasks = Array.new()
		task_instances.each do |ti|
			tasks.push(ti.task)
		end
		return tasks, task_instances
	end
end
