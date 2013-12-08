json.array!(@tasks) do |task|
  json.extract! task, :name, :description, :address, :price, :expirience, :status, :task_type, :content, :exp_require, :created_at, :updated_at, :latitude, :longitude
  json.url task_url(task, format: :json)
end
