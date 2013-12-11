module TasksHelper

	def nearbary_tasks(latitude, longitude, distance=10)
		center_point = [latitude, longitude]
		box = Geocoder::Calculations.bounding_box(center_point, distance)
		tasks = filter_by_free_inst(Task.within_bounding_box(box).concat(Task.not_geocoded))
	end

	def filter_by_free_inst(tasks)
		task_instances = Array.new() 
		tasks.each do |task|
			ti = task.task_instances.where(status: :created).first if !task.blank?
			if ti.nil?				
				tasks = tasks -[task]
			else
				task_instances.push(ti)
			end
		end
		return tasks, task_instances
	end

end
