def bsearch(arr, target)
  return "NOT FOUND" if arr.empty?

  midpoint = arr.length / 2
  mid_val = arr[midpoint]

  if mid_val == target
    return midpoint
  elsif mid_val > target
    bsearch(arr[0...midpoint], target)
  elsif mid_val < target
    answer = bsearch(arr[(midpoint + 1)..-1], target)
    return "NOT FOUND" unless answer != "NOT FOUND"
    midpoint + 1 + answer
  end
end


arr = [1, 2, 4, 6, 9, 11, 16, 19, 24]
bsearch(arr, 24)

def bsearch_with_duplicates(arr, target)
  return if arr.empty?

  midpoint = arr.length / 2
  mid_val = arr[midpoint]

  if mid_val == target
    # FIND LEFTMOST ELEMENT
    # possible_left = bsearch_with_duplicates(arr[0...midpoint], target)
    # possible_left ? possible_left : midpoint

    # FIND RIGHTMOST ELEMENT
    possible_right = bsearch_with_duplicates(arr[(midpoint + 1)..-1], target)
    possible_right ? (possible_right + midpoint + 1) : midpoint

  elsif mid_val > target
    bsearch_with_duplicates(arr[0...midpoint], target)
  elsif mid_val < target
    answer = bsearch_with_duplicates(arr[(midpoint + 1)..-1], target)
    return unless answer
    midpoint + answer + 1
  end
end

arr_with_dups = [1, 1, 3, 3, 3, 6, 6, 6, 6, 6, 9, 9, 9, 11, 15, 17, 18, 18]
p bsearch_with_duplicates(arr_with_dups, 3)
