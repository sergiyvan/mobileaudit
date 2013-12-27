module TaskInstancesHelper

	STATUS_AGENT = [
		"in_progress",
		"ready"
	]

	STATUS_OPERATOR = [
		"created",
		"in_progress",
		"ready",
		"finished",
		"paid",
		"to_rework"
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

	def user_statistic(user)
		tis_today_ready = TaskInstance.where("DATE(updated_at) = DATE(?) AND user_id = ? AND status = ?", Time.zone.now.beginning_of_day, user.id, :ready).count
		tis_today_finished = TaskInstance.where("DATE(updated_at) = DATE(?) AND user_id = ? AND status = ?", Time.zone.now.beginning_of_day, user.id, :finished).count
		tis_today_torework = TaskInstance.where("DATE(updated_at) = DATE(?) AND user_id = ? AND status = ?", Time.zone.now.beginning_of_day, user.id, :to_rework).count
		tis_week_ready = TaskInstance.where("DATE(updated_at) >= DATE(?) AND user_id = ? AND status = ?", 1.week.ago, user.id, :ready).count
		tis_week_finished = TaskInstance.where("DATE(updated_at) >= DATE(?) AND user_id = ? AND status = ?", 1.week.ago, user.id, :finished).count
		tis_week_torework = TaskInstance.where("DATE(updated_at) >= DATE(?) AND user_id = ? AND status = ?", 1.week.ago, user.id, :to_rework).count
		tis_month_ready = TaskInstance.where("DATE(updated_at) >= ? AND user_id = ? AND status = ?", 1.month.ago, user.id, :ready).count
		tis_month_finished = TaskInstance.where("DATE(updated_at) >= ? AND user_id = ? AND status = ?", 1.month.ago, user.id, :finished).count
		tis_month_torework = TaskInstance.where("DATE(updated_at) >= ? AND user_id = ? AND status = ?", 1.month.ago, user.id, :to_rework).count
		return {tis_today_ready: tis_today_ready, tis_today_finished: tis_today_finished, tis_today_torework: tis_today_torework, 
			tis_week_ready: tis_week_ready, tis_week_finished: tis_week_finished, tis_week_torework: tis_week_torework,
			tis_month_ready: tis_month_ready, tis_month_finished: tis_month_finished, tis_month_torework: tis_month_torework }
	end
end
