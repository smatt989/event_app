class Event < ActiveRecord::Base
  belongs_to :user
  has_many :shared_relationships, class_name: "EventShare", foreign_key: "event_id", dependent: :destroy
  has_many :sharers, through: :shared_relationships, source: :sharer
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :startTime, presence: true
  validates :endTime, presence: true
  validate :valid_event_dates?
  validate :picture_size

  def Event.from_users_followed_by(user)
    following_ids = "SELECT followed_id FROM following_relationships
                     WHERE  follower_id = :user_id"
    where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: user)
  end

  def Event.shared_by_users_followed_by(user)
  	following_ids = "SELECT followed_id FROM following_relationships
  					 WHERE follower_id = :user_id"
  	shared_event_ids = "SELECT DISTINCT event_id FROM event_shares
  	              		WHERE sharer_id IN (#{following_ids}) OR sharer_id = :user_id"
  	where("id IN (#{shared_event_ids})", user_id: user)
  end

  def as_json(options={})
    options[:methods] ||= [:user]
    super(options)
  end

  private 
    def valid_event_dates?
      if startTime && endTime
      	self.startTime > self.endTime
      else
      	return false
      end
    end

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
