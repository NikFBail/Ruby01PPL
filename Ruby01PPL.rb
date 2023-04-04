## Task 1
$hm = Hash.new

# Creating a string that has a lot of different parts to test several cases
str  = 'This is a string? A STRING THIS IS!!!!'
lowerstr = str.downcase # Converts a string to all lowercase

lowerstr.each_char { |c|
    # if the key already exists, add one to the value
    if $hm.has_key?(c)
        $hm[c] += 1
    else # otherwise create the key and set the value to one
        $hm[c] = 1
    end
}

puts $hm

## Task 2

# Finds the largest value of al the keys in $hm
biggestChar = $hm.max_by {|key, value| value} [0]

puts "The most frequent character in the string is #{biggestChar}"

## Task 3

# function takes a hash and a lambda, uses the lambda to compute any aggregate func on the hash
def useLambda(hash, lambda)
    # Uses inject for the lambda to perform an action using the key value pairs in the hash
    hash.inject(0) {|sum, (key, val)| lambda.call(sum, key, val)}
end 

# Uses regex to determine if a char is a vowel or not
def isVowel(c)
    return !c.downcase.match(/[aeiou]/).nil?
end

numVowels = -> (sum, key, val) {
    sum ||= 0 # set to 0 if nil, same for the ones below
    if isVowel(key)
        sum + val
    else
        sum
    end
}

# Uses regex to determine if there is any special characters(non-letters) in the string
numSpeChars = -> (sum, key, val) {
    sum ||= 0
    is_non_letter = key.match(/[^a-zA-Z]/)
    if is_non_letter
        sum + val
    end
}

# Finds all keys in the hash that have a value of 1
onlyOnce = -> (sum, key, val) {
    sum ||= 0 #for some reason this can also be sum == 0 and it still runs
    # but for the othe funcs, using '==' breaks the code. Why?
    if val == 1
        sum + 1
    else
        sum
    end
}

# Test case for numVowels lambda
result = useLambda($hm, numVowels)
puts "Total number of vowels in the hash: #{result}"

# Test case for numSpeChars lambda
result = useLambda($hm, numSpeChars)
puts "Total number of non-letter characters in the hash: #{result}" 

# Test case for onlyOnce lambda
result = useLambda($hm, onlyOnce)
puts "Total number of keys with a value of 1 in the hash: #{result}"