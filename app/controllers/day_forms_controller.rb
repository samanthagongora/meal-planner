class DayFormsController < ApplicationController

  def create
    @day_form = DayForm.new(day_form_params)
      day = Day.new
      if @day_form.create(day)
        redirect_to user_day_path(day.user, day.id), notice: 'Meal Plan Created!'
      else
        redirect_to new_user_day_path(day_form_params[:user_id]), notice: "Errors creating your meal plan."
      end
  end

  private

  def day_form_params
    params.require(:day_form).permit(:date, :user_id, :breakfast_id, :lunch_id, :dinner_id, :snack_id)
  end
end
