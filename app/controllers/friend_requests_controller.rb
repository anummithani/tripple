class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: %i[show edit update destroy]

  def index
    @q = FriendRequest.ransack(params[:q])
    @friend_requests = @q.result(distinct: true).includes(:sender,
                                                          :recepient).page(params[:page]).per(10)
  end

  def show; end

  def new
    @friend_request = FriendRequest.new
  end

  def edit; end

  def create
    @friend_request = FriendRequest.new(friend_request_params)

    if @friend_request.save
      message = "FriendRequest was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @friend_request, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @friend_request.update(friend_request_params)
      redirect_to @friend_request,
                  notice: "Friend request was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @friend_request.destroy
    message = "FriendRequest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to friend_requests_url, notice: message
    end
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :recepient_id)
  end
end
