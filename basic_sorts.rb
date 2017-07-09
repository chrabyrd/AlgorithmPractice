def quicksort(arr)
  return arr if arr.length < 2

  pivot = arr[0]

  left = arr[1..-1].select { |val| val <= pivot }
  right = arr[1..-1].select { |val| val > pivot }

  quicksort(left) + [pivot] + quicksort(right)
end

def merge_sort(arr)
  return arr if arr.length < 2

  midpoint = arr.length / 2

  left = arr[0...midpoint]
  right = arr[midpoint..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  ret_arr = []

  until left.empty? || right.empty?
    left.first < right.first ? ret_arr << left.shift : ret_arr << right.shift
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
merge_sort(arr)
p bubble_sort(arr)
