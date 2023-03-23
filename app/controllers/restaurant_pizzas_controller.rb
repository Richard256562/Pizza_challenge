class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity



    private
#throws errors cause of params
def restaurant_pizza_params
    params.permit(:price, :pizza_id, :restaurant_id)
end
def unprocessable_entity(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
end
end
