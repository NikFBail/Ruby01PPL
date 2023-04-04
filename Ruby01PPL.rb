## Task 1
$hm = Hash.new

str  = 'This is a string? A STRING THIS IS!!!!'
lowerstr = str.downcase

lowerstr.each_char { |c| 
    if $hm.has_key?(c)
        $hm[c] += 1
    else
        $hm[c] = 1
    end
}

puts $hm

## Task 2

biggestChar = $hm.max_by {|key, value| value} [0]

puts "The most frequent character in the string is #{biggestChar}"

## Task 3

def useLambda(hash, lambda)
    hash.inject(0) {|sum, (key, val)| lambda.call(sum, key, val)}
end 

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

numSpeChars = -> (sum, key, val) {
    sum ||= 0
    is_non_letter = key.match(/[^a-zA-Z]/)
    if is_non_letter
        sum + val
    end
}

onlyOnce = -> (sum, key, val) {
    sum ||= 0
    if val == 1
        sum + 1
    else
        sum
    end
}

# Test case for numVowels lambda
result = useLambda($hm, numVowels)
puts "Total number of vowels in the hash: #{result}"

# Test case for numNonLetters lambda
result = useLambda($hm, numSpeChars)
puts "Total number of non-letter characters in the hash: #{result}" 

# Test case for numOnce lambda
result = useLambda($hm, onlyOnce)
puts "Total number of keys with a value of 1 in the hash: #{result}"