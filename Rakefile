task default: :build
task build: %w(tokenizer.rb parser.rb)

file "tokenizer.rb" => "tokenizer.rl" do
  `ragel -R tokenizer.rl`
end

file "parser.rb" => "parser.y" do
  `racc -o parser.rb parser.y`
end
