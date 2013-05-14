require_relative "tokenizer.rb"
require_relative "parser.rb"
require_relative "generator.rb"
require_relative "vm.rb"

program = "5 - 3 + 2"

tokenizer = Boston::Tokenizer.new
tokens = tokenizer.tokenize(program)
puts tokens.inspect

parser = Boston::Parser.new
ast = parser.parse(tokens)
puts ast.inspect

generator = Boston::Generator.new
bytecode = generator.generate(ast)
puts bytecode.inspect

vm = Boston::VM.new
vm.run(bytecode)
