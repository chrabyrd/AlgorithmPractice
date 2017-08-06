def length_of_longest_substring(s)
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
