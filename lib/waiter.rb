
class Waiter
    @@all = []
    def initialize(name, experience)
        @name = name
        @experince = experience
        @@all << self
    end
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
      end   
      def self.all
        @@all
       end
       def waiters
        meals.map do |meal|
          meal.waiter
        end
      end

      def meals
        Meal.all.select do |meal|
            meal.waiter == self 
        end
      end

      def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip  # <=> comparison operator
        end
       
        best_tipped_meal.customer
      end
end