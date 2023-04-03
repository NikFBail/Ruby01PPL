## Task 1
$hm = Hash.new

str  = 'This is a string and A STRING THIS IS'
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

