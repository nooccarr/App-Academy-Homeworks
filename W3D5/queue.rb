# Exercise 2 - Queue
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and peek.

# Test your code to ensure it follows the principle of FIFO.

class Queue
    def initialize
        @arr = []
    end

    def enqueue(ele)
        @arr.push(ele)
    end

    def dequeue
        @arr.shift
    end

    def peek
        @arr.first
    end
end
