class Waiter
    @@all = []
    attr_accessor :name, :exp

    def initialize(name, exp)
        @name = name
        @exp = exp
        @@all.push(self)
    end 

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals()
        waiter_meals = []
        Meal.all.each do |meal|
            if meal.waiter == self
                waiter_meals.push(meal)
            end
        end
        waiter_meals 
    end 

    def best_tipper()
        highest_tipper = nil
        highest_tip = 0
        Meal.all.each do |meal|
            if highest_tip < meal.tip
                highest_tip = meal.tip
                highest_tipper = meal.customer
            end 
        end 
        highest_tipper
    end 


    def self.all()
        @@all
    end 

end