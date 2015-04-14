class Scope < ActiveRecord::Base

  has_many :event_types
  has_many :events

  validates_presence_of :name

end
