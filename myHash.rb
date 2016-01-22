require 'benchmark/ips'

class MyHash

def initialize(default = nil)
    @myHash = []
    @default = default
end

public
    def push(key, value)
        if @myHash.rassoc(key)
            raise ArgumentError, 'There is already such key in the hash'
        else
            @myHash << [value, key] 
        end
    end
    
    def [](key)
        res = @myHash.rassoc(key)
        if res
            res[0]
        else
            @default
        end
    end
    
    def []=(key, value = nil)
        res = @myHash.rassoc(key)
        if res
            res[0] = value
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
            @myHash.each {|key, value| puts key} 
        end
    end
    
    def each
        @myHash.each {|key, value|}
    end

    def size
       @myHash.size 
    end
    
    def delete_at(key)
        res = @myHash.rassoc(key)
        if res
            @myHash.delete([res[0], res[1]])
        else
            raise ArgumentError, 'There\'s no such key in the hash'
        end 
    end
end