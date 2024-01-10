class DateAvatarsController < ApplicationController
  before_action :set_date_avatar, only: %i[ show edit update ]

  def index
    @date_avatars = DateAvatar.all
  end

  def new
    @date_avatar = DateAvatar.new
  end

  def edit
  end

  def create
    @date_avatar = DateAvatar.new(date_avatar_params)

    respond_to do |format|
      if @date_avatar.save
        format.html { redirect_to date_avatar_url(@date_avatar), notice: "Date avatar was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @date_avatar.update(date_avatar_params)
        format.html { redirect_to date_avatar_url(@date_avatar), notice: "Date avatar was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_date_avatar
      @date_avatar = DateAvatar.find(params[:id])
    end

    def date_avatar_params
      params.require(:date_avatar).permit(:date, :avatar)
    end
end
