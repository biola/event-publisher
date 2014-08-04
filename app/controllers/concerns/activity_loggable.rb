module ActivityLoggable
  extend ActiveSupport::Concern

  def log_activity(changes, options ={})

    # if changes.class != Hash
    user = options[:user]
    activity = options[:activity]
    parent = options[:parent]
    child = options[:child]

    snapshot = changes.except "_id", "created_at", "updated_at", "actions"

    activity ||= params['action'] if (defined? params) && params['action'].present?
    user     ||= current_user if (defined? current_user)

    if snapshot.include?('published') && snapshot.size == 1
      if snapshot['published'].last == true
        activity = 'publish'
      elsif snapshot['published'].last == false
        activity = 'unpublish'
      end
    end

    message ||= child + ' ' + activity if child.present?

    action_to_log = ActivityLog.new( reviewer_ids: [], action_performed: activity, message: message, snapshot: snapshot, child: child )
    action_to_log.set_acting_user = user
    action_to_log.associated = parent if parent.present?
    action_to_log.save unless (changes.empty? && activity != 'destroy')

    if snapshot.include?('published') && snapshot.size > 1
      if snapshot['published'].last == true
        log_activity({"publish"=>[false, true]}, user: user, parent: parent, activity: 'publish')
      elsif snapshot['published'].last == false
        log_activity({"publish"=>[true, false]}, user: user, parent: parent, activity: 'unpublish')
      end
    end
  end
end
