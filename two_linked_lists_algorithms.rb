class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def add_two_numbers(l1, l2)
    remainder = 0
    head = nil
    tail = nil

    until !l1 && !l2
        val_1 = l1 ? l1.val : 0
        val_2 = l2 ? l2.val : 0
        node_val = val_1 + val_2 + remainder

        if node_val > 9
            remainder = node_val.to_s[0...-1].to_i
            node_val = node_val.to_s[-1].to_i
        else
            remainder = 0
        end

        node = ListNode.new(node_val)

        head = node if head.nil?
        tail.nil? ? tail = node : tail.next = node
        tail = node

        l1 = l1.next if l1
        l2 = l2.next if l2
    end

    return head if remainder == 0

    remainder_arr = remainder.to_s.split('')

    until remainder_arr.empty?
        node = ListNode.new(remainder_arr.shift.to_i)
        tail.next = node
        tail = node
    end

    head
end
