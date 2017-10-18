class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user_id, uniqueness:{scope: :event_id}

  def self.create_entry(current_user, params)
    create(user_id: current_user.id, event_id: params[:event_id])
  end

  def self.delete_entry(current_user, params)
    find_by(user_id: current_user.id, event_id: params[:event_id]).destroy
  end
end
