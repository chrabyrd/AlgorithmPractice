class Link
  attr_accessor :value, :next_link

  def initialize(value, next_link = nil)
    @value = value
    @next_link = next_link
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = Link.new(:head)
    @tail = nil
  end

  def iterate(node = @head)
    p node.value unless node.value == :head
    node.next_link.nil? ? return : iterate(node.next_link)
  end

  def append(val)
    new_link = Link.new(val)

    if @tail.nil?
      @head.next_link = new_link
      @tail = new_link
      return
    end

    @tail.next_link = new_link
    @tail = new_link
  end

  def prepend(val)
    new_link = Link.new(val)

    interim_val = @head.next_link
    @head.next_link = new_link
    new_link.next_link = interim_val
  end

  def delete(val)
    previous_link = nil
    current_link = @head

    until current_link.value == val || current_link == @tail
      previous_link = current_link
      current_link = current_link.next_link
    end

    return "NOT FOUND" unless current_link.value == val

    previous_link.next_link = current_link.next_link
  end

  def reverse!(start_node = @head, end_node = @tail)

  end

  def reverse_subset!(start_idx = 0, end_idx = 0)

  end
end

linked_list = LinkedList.new
linked_list.append('Hello')
linked_list.append('World')
linked_list.prepend('Yohoho')
linked_list.prepend('NO!')
linked_list.delete('NO!')
linked_list.append('Veridis')
linked_list.append('Quo')
# linked_list.iterate
# linked_list.reverse!
# linked_list.iterate
# linked_list.reverse_subset!(2, 4)
# linked_list.iterate
