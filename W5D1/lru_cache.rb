# LRU Cache

# Tonight we're going to use an array to implement a basic LRU Cache. This will be a simple implementation that doesn't use a hash-map or linked list. We will assume our input is limited to Integers, Strings, Arrays, Symbols, and Hashes. We will allow the user to set the size of the cache.

# Use the below framework to get started.

class LRUCache

    def count
        # returns number of elements currently in cache
        cache.length
    end

    def add(el)
        # adds element to cache according to LRU principle
        if cache.include?(el)
            cache.delete(el)
        elsif count == size
            cache.shift
        end
            
        cache << el
    end

    def show
        # shows the items in the cache, with the LRU item first
        p cache
    end

    private
    # helper methods go here!
    attr_reader :size, :cache

    def initialize(size)
        @size = size
        @cache = []
    end
end

# Once you have written your code, thoroughly test it to make sure it truly is an LRU Cache.
# Ultimately, our LRU Cache should function as follows:

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

# Time Complexity
# As you might have guessed, this is not the typical implementation of an LRU Cache. Any thoughts as to why?

# Let's consider the time complexity of the LRUCache#add method you wrote. In my solution it's O(n), where n is the size of the cache. For a large cache, that's a very lengthy process for simply adding one element. How might we improve the efficiency? Brainstorm some ways we might apply the ADTs from tonight's readings to do this.

# Bonus!
# Write specs to test that your implementation works!

