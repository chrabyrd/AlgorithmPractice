def longest_palindrome(s)
    hash = {}
    longest_count = 0
    remainder_exists = false

    s.chars.each { |letter| hash[letter] ? hash[letter] += 1 : hash[letter] = 1 }

    hash.keys.each do |key|

        until hash[key] < 2
            hash[key] -= 2
            longest_count += 2
        end

        remainder_exists = true if remainder_exists == false && hash[key] == 1
    end

    remainder_exists ? longest_count + 1 : longest_count

end

def length_of_longest_substring(s) #Without repeating characters
    str_arr = s.chars
    hash = {}
    queue = []
    longest = 0

    str_arr.each do |char|
        if hash[char]
            sub_val = queue.shift
            hash.delete(sub_val)

            until sub_val == char
                sub_val = queue.shift
                hash.delete(sub_val)
            end
        end

        hash[char] = true
        queue << char
        longest = queue.length if queue.length > longest
    end

    longest
end
