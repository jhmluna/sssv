class RequestsController < ApplicationController
  before_action :set_request, only: %i[get conclude show edit update]

  def index
    # raise
    case current_user.role
    when "manager"
      if params[:query].blank?
        @requests = policy_scope(Request)
      else
        if params[:button]
          # busca pelo termo especificado pelo usuario e presente no campo description
          @requests = policy_scope(Request).search_by_description(params[:query])
        else
          # busca pelos filtros pré estabelecidos: Abertas, Em Andamento, Realizadas, Todas
          @requests = policy_scope(Request).where(status: params[:query])
        end
      end
      render action: "index_manager" and return
    when "tech"
      @requests = policy_scope(Request.where(tech: nil, location: current_user.location).or(Request.where(tech: current_user, location: current_user.location)))
    when "citizen"
      @requests = policy_scope(Request.where(citizen: current_user))
    end
  end

  def show
    # set_request - Substituido pelo before_action
  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    # Cria um novo request
    @request = Request.new(request_params)
    @request.citizen = current_user
    authorize @request
    if @request.save
      redirect_to request_path(@request), notice: 'Request was successfully created into the catalog.'
    else
      render :new
    end
  end

  def edit
    # set_request - Substituido pelo before_action
  end

  def update
    # set_request - Substituido pelo before_action
    @request.update(tech: nil) if request_params["status"].eql?("Aberta")
    if @request.update(request_params)
      redirect_to request_path(@request), notice: 'Request was successfully updated.'
    else
      render :edit
    end
  end

  def get
    # set_request - Substituido pelo before_action
    @request.update(tech: current_user, status: "Em andamento")
    redirect_to requests_path
  end

  def conclude
    # set_request - Substituido pelo before_action
    @request.update(status: "Realizada")
    redirect_to requests_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def request_params
    params.require(:request).permit(:instrument, :service, :location, :status, :description, :report)
  end
end
