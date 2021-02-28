class PlansController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    get_week
    @plans = Plan.order("created_at DESC")
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
       redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to action: :index
  end

  def show
    @plan = Plan.find(params[:id])
    @comment = Comment.new
    @comments = @plan.comments.includes(:user)
  end
  private
  def plan_params
    params.require(:plan).permit(:text, :date, :part_id).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def get_week
    require "date"
    @todays_date = Date.today
    @week_days = []
    plans = Plan.where(date: @todays_date..@todays_date + 6)
    7.times do |x|
      today_plans = []
      plans.each do |plan|
        today_plans.push(plan.date) if plan.date == @todays_date + x
      end
    end
  end



end
