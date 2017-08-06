def two_sum(nums, target)
    hash = {}

    nums.each_with_index do |num, idx|
        return [hash[num], idx] if hash[num]
        hash[target - num] = idx
    end
end

def three_sum(nums)
    sorted_nums = nums.sort
    ret_arr = []

    sorted_nums.each_with_index do |num, idx|
        sub_arr = sorted_nums[(idx + 1)..-1]
        return ret_arr.uniq if sub_arr.empty?

        head_idx = 0
        tail_idx = sub_arr.length - 1

        until head_idx == tail_idx
            head = sub_arr[head_idx]
            tail = sub_arr[tail_idx]

            case (head + tail + num) <=> 0
            when -1
                head_idx += 1
            when 0
                ret_arr << [num, head, tail]
                head_idx += 1
            when 1
                tail_idx -= 1
            end
        end
    end
end
