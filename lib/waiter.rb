class Waiter
    attr_accessor :name, :age
    @@all = []
    def initialize(name,age)
      @name = name
      @age = age
  
      self.class.all << self
      
    end
  
    def self.all
      @@all
    end
    
    def new_meal(customer,total,tip)
      Meal.new(self,customer,total,tip)
    end

    def meals
      Meal.all.select{|meal|meal.waiter == self}
    end

    def best_tipper

      best_tipper = self.meals[0].customer
      best_tip = 0

        self.meals.each do |meal|
          if best_tip < meal.tip
            best_tipper = meal.customer
            best_tip = meal.tip
          end
        end
        best_tipper
    end

end