class Award
    attr_accessor :expires_in, :quality
    attr_reader :name
  
    def initialize(name, expires_in, quality)
      @name = name
      @expires_in = expires_in
      @quality = quality
    end
  
    def calc_quality
        
        return increment_quality if is_incrementable_award?
  
        decrease_quality

    end
  
    def calc_expiration
      @expires_in -= 1
      set_expired unless is_active?
    end
  
    private

    def blue_distinction_plus 
        return 'Blue Distinction Plus'
    end

    def blue_compare 
        return 'Blue Compare'
    end

    def blue_first 
        return 'Blue First'
    end

    def blue_start 
        return "Blue Star"
    end
  
    def decrease_quality
      if @quality <= 0
        return
      end

      if @name == self.blue_start
        return @quality -= 2 
      end
  
      return @quality -= 1
    end
  
    def increment_quality
      if @quality >= 50
        return
      end

      @quality += 1
      if @name != self.blue_compare || !is_active?
        return
      end
  
      @quality += 1 if @expires_in < 11
      @quality += 1 if @expires_in < 6
    end
  
    def is_incrementable_award?
      if ["Blue First", "Blue Compare"].include?(name)
        return true
      end
       
      return false 
    end
  
    def set_expired
      return @quality = 0 if @name == self.blue_compare
      return decrease_quality unless @name == self.blue_first
  
      increment_quality
    end
  
    def is_active?
      @expires_in >= 0 ? true : false
    end
end

