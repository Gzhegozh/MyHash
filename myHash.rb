require 'benchmark/ips'
require 'benchmark'

class MyHash

def initialize(default = nil)
    @myHash = []
    @default = default
end

private 
    def hashFunc(str)
        str.object_id % 100000000
    end

public
    def push(key, value)
        code = hashFunc(key)
        if @myHash[code] == nil
            @myHash[code] = [key, value]
        end
    end
    
    def [](key)
        code = hashFunc(key)
        if @myHash[code]
            @myHash[code][1]
        else
            @default
        end
    end
    
    def []=(key, value = nil)
        code = hashFunc(key)
        if @myHash[code]
            @myHash[code][1] = value
        else
            raise ArgumentError, 'There\'s no such key in the hash'
        end  
    end
    
    def to_s
        arr = @myHash.compact
        if arr.empty?
            puts "{}"
        else
            arr.each {|key, value| print "#{key} => #{value}\n"} 
        end
    end
    
    def print_keys
        arr = @myHash.compact
        if arr.empty?
            puts "{}"
        else
            arr.each {|key, value| puts key} 
        end
    end
    
    def print_values
        arr = @myHash.compact
        if arr.empty?
            puts "{}"
        else
            arr.each {|key, value| puts value} 
        end
    end
    
    def each
        arr = @myHash.compact
        arr.each {|key, value|}
    end

    def size
       puts "YEAH" 
       arr = @myHash.compact
       arr.size 
    end
    
    def delete_at(key)
        code = hashFunc(key)
        res = @myHash[code]
        if res
            @myHash.delete_at(code)
        else
            raise ArgumentError, 'There\'s no such key in the hash'
        end 
    end
end
