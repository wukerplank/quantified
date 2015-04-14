class EventType < ActiveRecord::Base

  belongs_to :scope
  has_many :events

  validates_presence_of :scope_id
  validates_presence_of :name

end
