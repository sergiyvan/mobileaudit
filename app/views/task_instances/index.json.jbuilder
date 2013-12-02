json.array!(@task_instances) do |task_instance|
  json.extract! task_instance, 
  json.url task_instance_url(task_instance, format: :json)
end
