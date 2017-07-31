ONES = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
}

def parse_tens(arr)
  tens = {
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    2 => "twenty",
    3 => "thirty",
    4 => "forty",
    5 => "fifty",
    6 => "sixty",
    7 => "seventy",
    8 => "eighty",
    9 => "ninety"
  }

  if arr[0] == 0
    ONES[arr[1]]
  elsif arr[0] == 1
    val = arr.join('').to_i
    tens[val]
  else
    "#{tens[arr[0]]} #{ONES[arr[1]]}"
  end
end

def parse_small_amounts(arr)
  # added to maintain functionality for integers < 1
  return [] if arr == [0]

  # added a check for mid-number values, where the first integer == 0
  if arr.length == 3 && arr[0] != 0
     "#{ONES[arr[0]]} hundred #{parse_tens(arr[1..2])}".strip
  elsif arr.length == 3
    "#{ONES[arr[0]]}#{parse_tens(arr[1..2])}".strip
  elsif arr.length == 2
    parse_tens(arr)
  else
    ONES[arr[0]]
  end
end

def partition_number(num)
  divided_arr = []
  input_arr = num.to_s.chars.map(&:to_i)

  divided_arr.unshift(input_arr.pop(3)) until input_arr.empty?
  divided_arr
end

def parse_number_array(arr)
  larger_values = {
    1 => "thousand",
    2 => "million",
    3 => "billion",
    4 => "trillion"

    # ...and if you need to write a check for more than 999 trillion dollars
    # both this function and the world's banking systems will fail you.
  }

  parsed_arr = arr.map.with_index do |sub_arr, idx|
    reverse_idx = (arr.length - 1) - idx

    # checks if sub_arr is full of 0's
    if larger_values[reverse_idx] && sub_arr.reduce(:+) != 0
      "#{parse_small_amounts(sub_arr)} #{larger_values[reverse_idx]}"
    else
      parse_small_amounts(sub_arr)
    end
  end

  parsed_arr
end

def parse_change(num)
  num = num.to_s
  spare_change = ""

  # necessary logic because Ruby chops off trailing 0's from floats
  if num[-2] == "."
    spare_change = " #{num[-1]}0/100"
    num = num[0...-2]
  elsif num[-3] == "."
    spare_change = " #{num[-2]}#{num[-1]}/100"
    num = num[0...-3]
  end

  return num.to_i, spare_change
end

def check_string(num)

  num, spare_change = parse_change(num)

  num_arr = partition_number(num)
  parsed_arr = parse_number_array(num_arr).reject(&:empty?) #added to fix spacing
  parsed_str = parsed_arr.join(' ')

  "#{parsed_str}#{spare_change}".strip
end

# p parse_small_amounts([1])
# p parse_small_amounts([1, 0])
# p parse_small_amounts([1, 1])
# p parse_small_amounts([1, 0, 0])
# p parse_small_amounts([1, 0, 1])
# p parse_small_amounts([1, 9, 9])
#
# p check_string(1) == 'one'
# p check_string(14) == 'fourteen'
# p check_string(30) == "thirty"
# p check_string(99) == "ninety nine"
# p check_string(100.00) == "one hundred 00/100"
# p check_string(101) == "one hundred one"
# p check_string(414) == "four hundred fourteen"
# p check_string(730) == "seven hundred thirty"
# p check_string(999) == "nine hundred ninety nine"
#
# p check_string(1000) == "one thousand"
# p check_string(1001) == "one thousand one"
# p check_string(10001) == "ten thousand one"
# p check_string(1101) == "one thousand one hundred one"
# p check_string(1001000) == "one million one thousand"
# p check_string(1001101) == "one million one thousand one hundred one"
# p check_string(1000000000) == "one billion"
# p check_string(99900001001) == "ninety nine billion nine hundred million one thousand one"
# p check_string(100010001001) == "one hundred billion ten million one thousand one"
# p check_string(999000000000) == "nine hundred ninety nine billion"
# p check_string(999000000001) == "nine hundred ninety nine billion one"
# p check_string(999000001001) == "nine hundred ninety nine billion one thousand one"
#
# p check_string(1999) == "one thousand nine hundred ninety nine"
# p check_string(8675309) == "eight million six hundred seventy five thousand three hundred nine"
# p check_string(7.30) == "seven 30/100"
# p check_string(7.17) == "seven 17/100"
# p check_string(7.06) == "seven 06/100"
# p check_string(0.06) == "06/100"
