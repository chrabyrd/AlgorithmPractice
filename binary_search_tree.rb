class Node
  attr_reader :val
  attr_accessor :left_child, :right_child

  def initialize(val)
    @val = val
    @left_child = nil
    @right_child = nil
  end
end

class BinarySearchTree
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(val)
    node = Node.new(val)

    if @head.nil?
      @head = node
    else
      insert_child_node(node, @head)
    end
  end

  def insert_child_node(node, branch_node)
    case node.val <=> branch_node.val
    when 1
      if branch_node.right_child != nil
        insert_child_node(node, branch_node.right_child)
      else
        branch_node.right_child = node
      end
    else
      if branch_node.left_child != nil
        insert_child_node(node, branch_node.left_child)
      else
        branch_node.left_child = node
      end
    end
  end

end

tree = BinarySearchTree.new
tree.insert(6)
tree.insert(7)
tree.insert(7)

p tree
