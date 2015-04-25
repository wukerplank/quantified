class EventType < ActiveRecord::Base

  belongs_to :user
  belongs_to :scope
  has_many :events

  validates_presence_of :name, :user_id, :scope_id

end
