module EventsHelper
    def not_attending? (id)
        current_user.attended_events.where('attended_event_id = ?', id).empty?    
    end
end
