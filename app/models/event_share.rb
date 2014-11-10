class EventShare < ActiveRecord::Base
  belongs_to :sharer, class_name: "User"
  belongs_to :shared_event, class_name: "Event"
  validates :sharer_id, presence: true
  validates :event_id, presence: true
end
