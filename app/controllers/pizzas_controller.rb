class PizzasController < ApplicationController
    def index
        pizzas = Pizza.all
        render json: pizzas, include: :pizzas

    end
end
