class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  # puts "#{node.value}"
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end


# 1. Let's write a method that prints out all the operators that exist in the tree. _Added Fun: If there are duplicate operators, don't print them separately, but instead print a tally of all operators found._

# recursively go down the tree starting from the root (left then right)
# return if the node is equal to nil
# if node value is nil, print it out.

def operators(node)
  return if node == nil
  operators(node.left)
  if node.left != nil || node.right != nil
    unless node.value.to_i.to_s == node.value
      print node.value + " "
    end
  end
  operators(node.right)
end


# 2. Write a method that returns the count of non-operators (in this case, leaves) in the tree. _Added Fun: print the level of the tree that each leaf appears on._

# this would be similar to the operator method
# recursively loop through the left then right
# if the node.value is not nil (= numeric) then +1 to the counter
# break case = 0
#
# def leafs(node, result)
#   return 0 if node == nil
#   if node.value.to_i.to_s == node.value
#     result = leafs(node.left, ) + leafs(node.right)
#
#   # end
# end
#
# def leafs(node)
#   leaf_helper(node.left) + leaf_helper(node.right)
# end

def leafs(node)
  return if node == nil
  leafs(node.left)
  if node.value.to_i.to_s == node.value
    print node.value+" "
  end
  leafs(node.right)
end

# 2. `3 + 2 - 10`
#     -
#   +  10
# 3  2

# 3. Write methods to print the tree in prefix and postfix notations.
# For prefix
# keep going down the left side of the (left) tree
# print out the nodes in order
# when it hits nil, go down the right side of the left tree
# when left-right hits nil, go down the right side of the tree
# repeat same left right sequence on the right side

def prefix(node)
  return if node == nil
  print node.value + " "
  prefix(node.left)
  prefix(node.right)
end

# For postfix
# Go down the left tree, all the way down the left
 # at the end, print out that node.
 # go down the right part, at the end print it
 # then proceed to print out the rest of the left.
 # again with the right??


def postfix(node)
  return if node == nil
  postfix(node.left)
  postfix(node.right)
  print node.value + " "
end



# 4. Write a method that returns whether or not a given operator exists in the tree. _Added fun: If the operator occurs more than once, return the count on how many times it occurs - you may return 0 if it doesn't exist in the tree._

# It would follow the operator method (but pop off an operator array)
# would check against an array of operators to see if it exists.

# 5. _Added Fun: Evaluate an infix binary tree._


# ## TDD
# 1. Come up with at least 3 test cases for problems 1-4 above. _Added Fun: #5 too._
# one for if there isn't a right part of the tree
# one with multiple operators in a row
# one with




# 1. `3 + 2`
  #   +
  # 3  2
root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
puts "infix"
puts print_infix(root) # 3 + 2
puts "prefix"
puts prefix(root) # + 3 2
puts "postfix"
puts postfix(root) # 3 2 +
puts "operators"
puts operators(root)
puts "leafs"
puts leafs(root)
puts


# 2. `3 + 2 - 10`
#     -
#   +  10
# 3  2
root = TreeNode.new("-")
root.left = TreeNode.new("+")
root.left.left = TreeNode.new("3")
root.left.right = TreeNode.new("2")
root.right = TreeNode.new("10")
puts "infix"
puts print_infix(root) # 3 + 2 - 10
puts "prefix"
puts prefix(root) # - + 3 2 10
puts "postfix"
puts postfix(root) # 3 2 + 10 -
puts "operators"
puts operators(root)
puts "leafs"
puts leafs(root)
puts


# 3. `(4 * 3) + 2`
  #     +
  #   *   2
  # 4   3
root = TreeNode.new("+")
root.left = TreeNode.new("*")
root.left.left = TreeNode.new("4")
root.left.right = TreeNode.new("3")
root.right = TreeNode.new("2")
puts "infix"
puts print_infix(root) # 4 * 3 + 2
puts "prefix"
puts prefix(root) # + * 4 3 2
puts "postfix"
puts postfix(root) # 4 3 * 2 +
puts "operators"
puts operators(root)
puts "leafs"
puts leafs(root)
puts

# # 4. `( (4 * 3 )+ 2 )- (10 % 5)`
#         -
#       2  %
#     +   5  10
#   *
# 4  3


root = TreeNode.new("-")
root.left = TreeNode.new("2")
root.left.left = TreeNode.new("+")
root.left.left.left = TreeNode.new("*")
root.left.left.left.left = TreeNode.new("4")
root.left.left.left.right = TreeNode.new("3")
root.right = TreeNode.new("%")
root.right.right = TreeNode.new("10")
root.right.left = TreeNode.new("5")
puts "infix"
puts print_infix(root) # 4 * 3 + 2 - 10 % 5
puts "prefix"
puts prefix(root) # - 2 + * 4 3 % 5 10
puts "postfix"
puts postfix(root) # 4 3 * + 2 5 10 % -
puts "operators"
puts operators(root)
puts "leafs"
puts leafs(root)
puts
