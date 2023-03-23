class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_method


    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza, status: :created
    end
    private
#throws errors cause of params
def restaurant_pizza_params
    params.permit(:price, :pizza_id, :restaurant_id)
end

def unprocessable_entity_method(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
end
end
