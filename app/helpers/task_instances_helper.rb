module TaskInstancesHelper

	STATUS_AGENT = [
		"created",
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
end
