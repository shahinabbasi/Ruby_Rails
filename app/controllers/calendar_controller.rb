class CalendarController < ApplicationController
  def index
    @calendar_all = Calendar.all
    render component: 'all_itm', props: { calendar: @calendar_find }, class: 'cal'
  end

  def new
    @calendar = Calendar.new
    @calendar_all = Calendar.all
    if  params[:id]
      @calendar_find   = Calendar.find(params[:id])
    end
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to action: "new"
    else
      render action: "new"
    end
  end

  def show
  end

  def update
    @calendar  = Calendar.find(params[:id])
    if @calendar.update_attributes( calendar_params)
      redirect_to action: "new"
      else
      render action: "edit"
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to action:"new"
  end

  def delete
  end

  private
  def calendar_params
    params.require(:calendar).permit(:description,:date_define,:start_time,:end_time)
  end
end
