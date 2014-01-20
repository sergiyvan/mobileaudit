class Task < ActiveRecord::Base
	has_many :task_instances, dependent: :destroy
	has_many :users, :through => :task_instances
	serialize :content
	validates :expdate, presence: true

	geocoded_by :address
	after_validation :geocode
end
