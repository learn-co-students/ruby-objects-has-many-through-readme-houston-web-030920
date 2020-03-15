class Customer
    @@all = []
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age 
        @@all.push(self)
    end 

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end 

    def meals()
        customer_meals = []
        Meal.all.each do |meal|
            if meal.customer == self
                customer_meals.push(meal)
            end 
        end
        customer_meals 
    end 

    def waiters()
        customer_waiters = []
        Meal.all.each do |meal|
            if meal.customer == self
                customer_waiters.push(meal.waiter)
            end 
        end
        customer_waiters 
    end 

    def self.all()
        @@all
    end 
end