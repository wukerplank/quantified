class Scope < ActiveRecord::Base

  belongs_to :user

  has_many :event_types
  has_many :events

  validates_presence_of :name, :user_id

end
