# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_into_tree(@root, value)
  end

  def find(value, tree_node = @root)
    if tree_node.nil?
      return nil
    elsif value < tree_node.value
      find(value, tree_node.left)
    elsif value > tree_node.value
      find(value, tree_node.right)
    else
      return tree_node
    end
  end

  def delete(value, tree_node = @root)
    target = find(value, tree_node)
    return nil unless target

    parent = find_parent(value, tree_node)

    if target.left.nil? && target.right.nil?
      if parent.nil?
        @root = nil
      else
        parent.value >= value ? parent.left = nil : parent.right = nil
      end

    elsif one_child?(target)
      new_child = target.left ? target.left : target.right
      if parent.value > value
        parent.left = new_child
      else
        parent.right = new_child
      end

    else
      max = maximum(target.left)
      if parent.nil?
        @root = max
      elsif parent.value > value
        parent.left = max
      else
        parent.right = max
      end

      delete(max.value, target.left)
    end

    target = nil
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node unless tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    left_depth > right_depth ? left_depth + 1 : right_depth + 1
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?

    balanced = true
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)
    balanced = false if (left_depth - right_depth).abs > 1

    return (balanced) && is_balanced?(tree_node.left) &&
      is_balanced?(tree_node.right) ? true : false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
  end


  private
  # optional helper methods go here:

  def insert_into_tree(tree_node, value)
    return BSTNode.new(value) if tree_node.nil?

    if value <= tree_node.value
      tree_node.left = insert_into_tree(tree_node.left, value)
    elsif value > tree_node.value
      tree_node.right = insert_into_tree(tree_node.right, value)
    end

    tree_node
  end

  def find_parent(value, tree_node = @root)
    if value == @root.value
      return nil
    elsif one_child?(tree_node)
      if tree_node.left
        return tree_node if tree_node.left.value == value
      else
        return tree_node if tree_node.right.value == value
      end
    elsif tree_node.left.value == value || tree_node.right.value == value
      return tree_node
    end

    if value < tree_node.value
      find_parent(value, tree_node.left)
    elsif value > tree_node.value
      find_parent(value, tree_node.right)
    end
  end

  def one_child?(target)
    (target.left.nil? && target.right) || (target.left && target.right.nil?)
  end

end
