class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_error
    def index
        restaurant = Restaurant.all
        render json: restaurant, include: :restaurants
    end 

    def show
        restaurant = find_restaurant
        render json: restaurant, include:[:pizzas]
    end

    private
    def find_restaurant
        Restaurant.find(params[:id])
    end
    def record_error
        render json: {error: "Restaurant  not found"}

    end
end
