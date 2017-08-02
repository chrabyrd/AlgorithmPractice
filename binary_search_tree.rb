class Node
  attr_reader :val
  attr_accessor :left_child, :right_child, :parent_node

  def initialize(val)
    @val = val
    @left_child = nil
    @right_child = nil
    @parent_node = nil
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
      insert_child_node(@head, node)
    end
  end

  def insert_child_node(branch_node, node)
    case node.val <=> branch_node.val
    when 1
      if branch_node.right_child != nil
        insert_child_node(branch_node.right_child, node)
      else
        branch_node.right_child = node
        node.parent_node = branch_node
      end
    else
      if branch_node.left_child != nil
        insert_child_node(branch_node.left_child, node)
      else
        branch_node.left_child = node
        node.parent_node = branch_node
      end
    end
  end

  def find(val, branch_node = @head)
    return "NOT FOUND" if branch_node == nil
    return branch_node if branch_node.val == val

    case val <=> branch_node.val
    when 1
      find(val, branch_node.right_child)
    else
      find(val, branch_node.left_child)
    end
  end

  def delete(val)
    node = find(val)
    return unless node != "NOT FOUND"

    if node.right_child.nil? && node.left_child.nil?
      delete_child_node(node.parent_node, node)
    elsif node.right_child.nil? || node.left_child.nil?
      parent_node = node.parent_node
      child_copy = node.left_child || node.right_child
      child_copy.parent_node = nil

      if node == @head
        @head = child_copy
      else
        delete_child_node(parent_node, node)
        insert_child_node(parent_node, child_copy)
      end

    else
      parent_node = node.parent_node
      #rightmost child in left subtree
      replacement_node = find_replacement_node(node.left_child)

      if replacement_node.left_child != nil
        replacement_node.parent_node.right_child = replacement_node.left_child
      end

      delete_child_node(replacement_node.parent_node, replacement_node)
      replacement_node.left_child, replacement_node.right_child = nil
      replacement_node.parent_node = nil

      if node == @head
        node.right_child.parent_node = replacement_node
        node.left_child.parent_node = replacement_node

        p node

        replacement_node.right_child = node.right_child
        replacement_node.left_child = node.left_child

        @head = replacement_node
      else
        replacement_node.parent_node = parent_node
        delete_child_node(parent_node, node)
        insert_child_node(parent_node, replacement_node)
      end
    end
  end

  def delete_child_node(parent_node, child_node)
    if parent_node.left_child == child_node
      parent_node.left_child = nil
    else
      parent_node.right_child = nil
    end
  end
end

def find_replacement_node(node)
  return node if node.right_child.nil?
  find_replacement_node(node.right_child)
end

tree = BinarySearchTree.new
tree.insert(6)
tree.insert(4)
tree.insert(7)
# tree.insert(8)
# tree.insert(9)
# tree.insert(8)
# p tree.find(8)
# p tree.find(5)
# tree.delete(4)
# tree.delete(7)
tree.delete(6)
p tree
tree.delete(99)
