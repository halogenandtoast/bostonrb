%%{
  machine boston;
  operator = "+" | "-";
  number = digit+;

  main := |*
    number => { emit(:NUMBER, data, ts, te) };
    operator => { emit(:OPERATOR, data, ts, te) };
    space;
  *|;
}%%

module Boston
  class Tokenizer
    def initialize
      %% write data;
      # % fix sytax
    end

    def tokenize program
      @tokens = []
      data = program
      eof = data.length
      %% write init;
      %% write exec;
      @tokens
    end

    def emit(name, data, start, stop)
      @tokens << [name, data[start...stop]]
    end

  end
end
