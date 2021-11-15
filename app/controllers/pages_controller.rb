class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: %i[show edit update]

  def home
  end

  def index
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to page_path(@user), notice: 'Seus dados foram atualizados com sucesso.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:full_name, :phone_number, :address)
  end
end
