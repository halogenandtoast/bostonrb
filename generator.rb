module Boston
  class Generator
    def generate ast
      @bytecode = []
      ast.visit(self)
      print
      @bytecode
    end

    def add
      @bytecode << [:ADD]
    end

    def sub
      @bytecode << [:SUB]
    end

    def push value
      @bytecode << [:PUSH, value]
    end

    def print
      @bytecode << [:PRINT]
    end
  end
end
