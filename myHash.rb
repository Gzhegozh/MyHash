class MyHash

def initialize(default = nil)
    @myHash = []
    @default = default
end

public
    def push(key, value)
        if @myHash.rassoc(key) == nil
            @myHash << [value, key]
        else
            raise ArgumentError, 'There is already such key in the hash'
        end
    end
    
    def [](key)
        if @myHash.rassoc(key) != nil
            return @myHash.rassoc(key)[0]
        elsif @default != nil
            return @default
        else
            return nil
        end
    end
    
    def []=(key, value = nil)
        if @myHash.rassoc(key) != nil
            @myHash.rassoc(key)[0] = value
        else
            raise ArgumentError, 'There\'s no such key in the hash'
        end  
    end
    
    def to_s
        if @myHash.empty?
            puts "{}"
        else
            @myHash.each {|key, value| print "#{value} => #{key}\n"} 
        end
    end
    
    def print_keys
        if @myHash.empty?
            puts "{}"
        else
            @myHash.each {|key, value| puts value} 
        end
    end
    
    def print_values
        if @myHash.empty?
            puts "{}"
        else
            @myHash.each {|key, value| puts keys} 
        end
    end
    
    def size
       puts @myHash.size 
    end
    
    def delete_at(key)
        if @myHash.rassoc(key) != nil
            @myHash.delete([@myHash.rassoc(key)[0], @myHash.rassoc(key)[1]])
        else
            raise ArgumentError, 'There\'s no such key in the hash'
        end 
    end
end


myHash = MyHash.new
myHash.to_s
myHash.push("a", 1)
myHash.push(:b, 2)

myHash[:b] = 3
myHash.to_s