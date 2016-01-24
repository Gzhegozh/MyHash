require_relative 'myHash.rb'

a = []

    def my_hash_push()
        myHash = MyHash.new
        c = 1000000
        (1..c).each do |i|
            myHash.push(i.to_s.to_sym, "bar#{i}")
        end
        myHash
    end

    def ruby_hash_push()
        rubyHash = {}
        c = 1000000
        (1..c).each do |i|
            rubyHash[i.to_s.to_sym] = "bar#{i}"
        end
        rubyHash
    end

        c = 1000000
        (1..c).each do |i|
            a[i] = "bar#{i}"
        end

    myHash = my_hash_push()
    rubyHash = ruby_hash_push()

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
        x.report("MyHash") {my_hash_search(myHash, :"#{501123}")}
        x.report("RubyHash") {ruby_hash_search(rubyHash, :"#{501123}")}
        x.report("Array") {array_search(a, "bar501123")}
        x.compare!
    end

    puts "////////////////////////////////////////////"

    puts "set"
    Benchmark.ips do |x|
        x.report("MyHash") {my_hash_set(myHash, :"#{501123}", 6666)}
        x.report("RubyHash") {ruby_hash_set(rubyHash, :"#{501123}", 6666)}
        x.compare!
    end

    puts "////////////////////////////////////////////"

    puts "push"
    Benchmark.ips do |x|
        x.report("RubyHash") {ruby_hash_push()}
        x.report("MyHash") {my_hash_push()}
        x.compare!
    end
