class Event < ActiveRecord::Base

  serialize :data, Array

  belongs_to :user
  belongs_to :scope
  belongs_to :event_type

  validates_presence_of :user_id, :scope_id, :event_type_id

  before_validation :set_scope_id

  private

  def set_scope_id
    self.scope_id = event_type.scope_id if event_type.present?
  end

end
