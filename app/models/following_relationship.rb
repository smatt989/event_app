class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def as_json(options={})
    options[:methods] ||= [:follower, :followed]
    super(options)
  end
end
