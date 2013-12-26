class Task < ActiveRecord::Base
	has_many :task_instances, dependent: :destroy
	has_many :users, :through => :task_instances
	serialize :content

	geocoded_by :address
	after_validation :geocode
end
