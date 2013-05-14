class Boston::Parser
rule
  program: statement { result = Root.new(val[0]) }
  statement: statement OPERATOR term { result = BinaryOperator.new(val[1], val[0], val[2]) }
           | term
  term: NUMBER { result = Term.new(val[0].to_i) }

---- header
module Boston
  class Root < Struct.new(:statement)
    def visit g
      statement.visit(g)
    end
  end

  class BinaryOperator < Struct.new(:operator, :left, :right)
    def visit g
      left.visit g
      right.visit g
      if operator == "+"
        g.add
      elsif operator == "-"
        g.sub
      end
    end
  end

  class Term < Struct.new(:value)
    def visit g
      g.push value
    end
  end
end

---- inner

def parse tokens
  @tokens = tokens.dup
  do_parse
end

def next_token
  @tokens.shift
end
