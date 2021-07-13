describe "Event" do
    it "Add an event " do
        e = Event.new()
        out=e.addEvent(total_events)
        expect(out).to eq("Event Add Successfully")
    end
    it "Modify an event " do
        e = Event.new()
        out=e.modifyEvent(total_events)
        expect(out).to eq("Event Modify Successfully")
    end
    it "Delete an Event " do
        e = Event.new()
        out=e.deleteEvent(total_events)
        expect(out).to eq("Event Deleted Successfully")
    end
end