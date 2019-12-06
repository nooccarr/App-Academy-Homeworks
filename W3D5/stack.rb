# Exercise 1 - Stack
# Let's write a Stack class. To do this, use the following framework:

# To test that your code works, create a new instance of the Stack class, and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!

class Stack
    def initialize
        # create ivar to store stack here!
        @arr = []
    end

    def push(ele)
        # adds an element to the stack
        @arr << ele
    end
    
    def pop
        # removes one element from the stack
        @arr.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @arr.last
    end
end