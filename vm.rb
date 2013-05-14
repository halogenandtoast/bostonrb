module Boston
  class VM
    def initialize
      @stack = []
    end

    def run bytecode
      bytecode.each do |instruction|
        op = instruction.shift
        if op == :ADD
          right = @stack.pop
          left = @stack.pop
          @stack << left + right
        elsif op == :SUB
          right = @stack.pop
          left = @stack.pop
          @stack << left - right
        elsif op == :PUSH
          @stack << instruction.shift
        elsif op == :PRINT
          puts @stack.pop
        end
      end
    end
  end
end
