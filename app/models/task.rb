class Task < ActiveRecord::Base
	has_many :task_instances, dependent: :destroy

	geocoded_by :address
	after_validation :geocode
end
