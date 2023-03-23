class RestaurantPizza < ApplicationRecord
    belongs_to :pizza
    belongs_to :restaurant
    validates :price, presence: true
    validate :price_range
  
    def price_range
      if price.present? && (price < 1 || price > 30)
        errors.add(:price, "must be between 1 and 30")
      end
    end
  end
  