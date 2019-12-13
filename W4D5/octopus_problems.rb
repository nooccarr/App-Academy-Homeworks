# Big O-ctopus and Biggest Fish

# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

FISH = [
    'fish', 
    'fiiish', 
    'fiiiiish', 
    'fiiiish', 
    'fffish', 
    'ffiiiiisshh', 
    'fsh', 
    'fiiiissshhhhhh'
]

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sulggish_octopus(fish)
    new_fish = []

    (0...fish.length).each_with_index do |i|
        (i + 1...fish.length).each_with_index do |j|
            case fish[i].length <=> fish[i + 1].length
            when 1
                new_fish << fish[i]
            when -1
                new_fish << fish[i + 1]
            end
        end
    end

    new_fish.inject do |longest, fish|
        if longest.length > fish.length
            longest
        else
            fish
        end
    end
end

p sulggish_octopus(FISH)

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.

def quicksort(fish)
    return fish if fish.length <= 1

    pivot = fish.first
    left = fish[1..-1].select { |ele| ele.length < pivot.length }
    right = fish[1..-1].select { |ele| ele.length > pivot.length }

    quicksort(left) + [pivot] + quicksort(right)
end

def dominant_octopus(fish)
    quicksort(fish).last
end

p dominant_octopus(FISH)

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(fish)
    largest = fish.first
    fish.each { |ele| largest = ele if ele.length > largest.length }

    largest
end

p clever_octopus(FISH)

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(target, arr)
    arr.each_with_index { |ele, i| return i if ele == target }
end

p slow_dance("up", tiles_array)
# > 0

p slow_dance("right-down", tiles_array)
# > 3

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

new_tiles_data_structure = { "up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }

def fast_dance(target, hash)
    hash[target]
end

p fast_dance("up", new_tiles_data_structure)
# > 0

p fast_dance("right-down", new_tiles_data_structure)
# > 3



