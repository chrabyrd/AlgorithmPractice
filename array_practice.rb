def spiral_order(matrix)
    dup = matrix.dup
    @ret_arr = []

    until dup.empty?
        shift_upper(dup)
        shift_rightmost(dup)
        shift_lower(dup)
        shift_leftmost(dup)
    end

    @ret_arr.reject { |val| !val }
end

def shift_upper(duped_matrix)
    return if duped_matrix.empty?
    duped_matrix.shift.each { |val| @ret_arr << val }
end

def shift_rightmost(duped_matrix)
    return if duped_matrix.empty?
    duped_matrix.each { |arr| @ret_arr << arr.pop }
end

def shift_lower(duped_matrix)
    return if duped_matrix.empty?
    duped_matrix.pop.reverse.each { |val| @ret_arr << val }
end

def shift_leftmost(duped_matrix)
    return if duped_matrix.empty?
    duped_matrix.reverse.each { |arr| @ret_arr << arr.shift }
end
