class AssignmentsController < ApplicationController
  before_filter :require_logged_in

  def show
    @assignment = Assignment.find(params[:id])
    case current_user.relationship_to_assignment(@assignment)
    when :student
      @courses = @assignment.courses
      @user_submissions = @assignment.submissions
                                     .where(:user_id => current_user.id)
      render :show_to_student
    when :staff

      @submissions = @assignment.relevant_submissions(current_user)

      render :show_to_staff
    when :convenor
      @submissions = @assignment.relevant_submissions(current_user)
      render :show_to_staff
    end
  end
end
