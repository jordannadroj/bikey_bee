class Api::V1::BikesController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User, except: [ :index, :show ]
    before_action :set_bike, only: [ :show, :update ]

    def index
      @bikes = policy_scope(Bike)
    end

    def show
    end

    def update
      if @bike.update(bike_params)
        render :show
      else 
        render_error
      end
    end

    
    private 

    def set_bike
      @bike = Bike.find(params[:id])
      authorize @bike # for pundit
    end

    def bike_params
        params.require(:bike).permit(:name, :location)
      end
    
      def render_error
        render json: { errors: @bike.errors.full_messages },
          status: :unprocessable_entity
      end
  end