json.array!(@tasks) do |task|
  json.extract! task, :name, :description, :address, :price, :expirience, :status, :task_type, :content, :exp_require
  json.url task_url(task, format: :json)
end
