def quicksort(arr)
  return arr if arr.length < 2

  pivot = arr[0]

  left = arr[1..-1].select { |val| val <= pivot }
  right = arr[1..-1].select { |val| val > pivot }

  quicksort(left) + [pivot] + quicksort(right)
end

def merge_sort(arr)
  return arr if arr.size < 2

  mid = arr.size / 2

  sorted_left = merge_sort(arr[0...mid])
  sorted_right = merge_sort(arr[mid..-1])

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  ret_arr = []

  until left.empty? || right.empty?
    left[0] < right[0] ? ret_arr << left.shift : ret_arr << right.shift
  end

  ret_arr + left + right
end

def bubble_sort(arr)
  (arr.length - 1).times do
    arr[0..-2].each_index do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
      end
    end
  end

  arr
end

arr = [1, 3, 6, 2, 3, 8, 2, 3, 0, 1, -1, 22, 2243, 42]
quicksort(arr)
p merge_sort(arr)
bubble_sort(arr)
