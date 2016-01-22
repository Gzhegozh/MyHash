require_relative 'myHash.rb'

key_values = [["a", 1], ["b", 234], [:c, :d], [:asd, "sdfsdf"], ["qwe", "rty"], [123, 234], ["aaaaaaaaaaaaaaaa", 9999999999999]]
a = [1, 234, :d, "sdfsdf", "rty", 234, 9999999999999]
myHash = MyHash.new
rubyHash = {}

    def my_hash_push(args)
        myHash = MyHash.new
        args.each do |key, value|
            myHash.push(key, value)
        end
        return myHash
    end

    def ruby_hash_push(args)
        rubyHash = {}
        args.each do |key, value|
            rubyHash[key] = value
        end
        return rubyHash
    end

    myHash = my_hash_push(key_values)
    rubyHash = ruby_hash_push(key_values)

    def my_hash_get(myHash)
        myHash.each do |key, value|
            x = myHash[key]
        end
    end

    def ruby_hash_get(rubyHash)
        rubyHash.each do |key, value|
            x = rubyHash[key]
        end
    end

    def array_get(arr)
        arr.each do |key, value|
            x = value
        end
    end

    def my_hash_set(myHash, key, value)
        myHash[key] = value
    end

    def ruby_hash_set(rubyHash, key, value)
        rubyHash[key] = value
    end

    def my_hash_search(myHash, key)
        myHash[key]
    end

    def ruby_hash_search(rubyHash, key)
        rubyHash[key]
    end

    def array_search(arr, value)
        arr.index(value)
    end

    puts "search"
    Benchmark.ips do |x|
        x.report("MyHash") {my_hash_search(myHash, "qwe")}
        x.report("RubyHash") {ruby_hash_search(rubyHash, "qwe")}
        x.report("Array") {array_search(a, "rty")}
        x.compare!
    end

    puts "////////////////////////////////////////////"

    puts "set"
    Benchmark.ips do |x|
        x.report("MyHash") {my_hash_set(myHash, "qwe", "sdf")}
        x.report("RubyHash") {ruby_hash_set(rubyHash, "qwe", "sdf")}
        x.compare!
    end

    puts "////////////////////////////////////////////"

    puts "push"
    Benchmark.ips do |x|
        x.report("RubyHash") {ruby_hash_push(key_values)}
        x.report("MyHash") {my_hash_push(key_values)}
        x.compare!
    end

    puts "////////////////////////////////////////////"

    puts "get"
    Benchmark.ips do |x|
        x.report("RubyHash") {ruby_hash_get(rubyHash)}
        x.report("MyHash") {my_hash_get(myHash)}
        x.report("Array") {array_get(key_values)}
        x.compare!
    end