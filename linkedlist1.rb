class LinkedListNode
  attr_accessor :value, :next_node

  def initialize (value, next_node=nil)
    @value = value 
    @next_node = next_node
  end
end

class Stack 
  attr_reader :data

  def initialize 
    @data = nil 
  end 

  def value 
    @data.value if @data
  end

  def next_node 
    @data.next_node if @data
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  #pop item off stack 
  #remove last item that was pushed onto the stack and return the value to the user
  def pop
    return nil if @data.nil?
    head = @data
    @data = @data.next
    return head
  end
end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list_node)
  reversed_node = nil
  node = list_node
  while !node.nil?
    reversed_node = LinkedListNode.new(node.value, reversed_node)
    node = node.next_node
  end
  return reversed_node
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "---------"

reverseList = reverse_list(node3)

print_values(reverseList)

