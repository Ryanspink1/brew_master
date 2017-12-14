require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  context "validations" do
    it { should validate_presence_of(:event_id)}
    it { should validate_presence_of(:user_id)}
  end

  context "relationships" do
    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end

  describe "create_entry" do
    it "creates an entry" do
      event        = Fabricate(:event, id:1)
      current_user = Fabricate(:user, id:1)

      expect(UserEvent.count).to     eq(0)
      expect(UserEvent.count).to_not eq(1)

      UserEvent.create_entry(current_user, {event_id: event.id})

      expect(UserEvent.count).to     eq(1)
      expect(UserEvent.count).to_not eq(0)
    end
  end

  describe "delete_entry" do
    it "creates an entry" do
      event        = Fabricate(:event, id:1)
      current_user = Fabricate(:user, id:1)
      UserEvent.create_entry(current_user, {event_id: event.id})

      expect(UserEvent.count).to     eq(1)
      expect(UserEvent.count).to_not eq(0)

      UserEvent.delete_entry(current_user, {event_id: event.id})

      expect(UserEvent.count).to     eq(0)
      expect(UserEvent.count).to_not eq(1)
    end
  end
end
