class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: %i[show edit update]

  def home
  end

  def index
  end

  def show; end

  def edit; end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
