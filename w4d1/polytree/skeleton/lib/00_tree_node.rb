class PolyTreeNode

    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        if @parent == nil
            @parent = new_parent
            @parent.children << self if @parent != nil
        elsif  new_parent == nil
            @parent.children.delete(self)
            @parent = nil
        elsif !new_parent.children.include?(self)
            @parent.children.delete(self)
            new_parent.children << self
            @parent = new_parent
        end

    end

    def add_child(child)
        child.parent = self if !@children.include?(child)
    end

    def remove_child(child)
        raise "child is an orphan" if child.parent == nil
        child.parent = nil if @children.include?(child)
    end

    def dfs(target)
        # base case target == value => value
        # base case node has no children => nil

        return self if @value == target
        @children.each do |child|
            result = child.dfs(target)
            return result if !result.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            return queue.first if queue.first.value == target
            queue += queue.first.children
            queue.shift
        end
        return nil


    end

    def inspect
        { 'value' => @value, 'parent_value' => @parent.value, 'children' => @children }.inspect
    end
end


