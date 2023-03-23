class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity



    private
def unprocessable_entity(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
end
end
