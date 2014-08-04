class ActivityLogsController < ApplicationController
  layout false
  before_filter :set_parent
  before_filter :set_activity_log, only: [:edit, :update]
  before_filter :new_activity_log_from_params, only: [:new, :create]
  before_filter :pundit_authorize

  def new
  end

  def create
    initialize_attrs if @activity_log.associated_id.nil?
    # TODO: Make it so that reviewer_ids is dynamic (each non crud action includes all user ids)
    # @activity_log.reviewer_ids << 'current_user.id' if @activity_log.non_crud_actionable_action? && current_user.present?
    if @activity_log.save
      flash[:info] = 'Action successfully recorded.'
    else
      flash[:error] = 'Something went wrong. Please try again.'
    end
    redirect_to parent_edit_path(@parent, anchor: 'activity_logs')
  end

  def edit
  end

  def update
    if @activity_log.update_attributes(activity_log_params)
      flash[:info] = "Action has been successfully updated."
    else
      flash[:error] = "Something went wrong. Please try again."
    end
    redirect_to parent_edit_path(@parent, anchor: 'activity_logs')
  end

  private
  def set_activity_log
    @activity_log = ActivityLog.for_associated(@parent).to_a.find {|a| a.id.to_s == params[:id]}
  end

  def new_activity_log_from_params
    if params[:activity_log]
      @activity_log = ActivityLog.new(activity_log_params)
    else
      @activity_log = ActivityLog.new
    end
  end

  def activity_log_params
    params.require(:activity_log).permit(:reviewer_ids, :action_performed, :message, :snapshot, :child)
  end

  def initialize_attrs
    @activity_log.associated = @parent if @parent.present?
    @activity_log.set_acting_user = current_user if current_user.present?
  end

  def pundit_authorize
    authorize (@activity_log || ActivityLog)
  end

end
