
# line 1 "tokenizer.rl"

# line 11 "tokenizer.rl"


module Boston
  class Tokenizer
    def initialize
      
# line 12 "tokenizer.rb"
class << self
	attr_accessor :_boston_actions
	private :_boston_actions, :_boston_actions=
end
self._boston_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4
]

class << self
	attr_accessor :_boston_key_offsets
	private :_boston_key_offsets, :_boston_key_offsets=
end
self._boston_key_offsets = [
	0, 0, 7
]

class << self
	attr_accessor :_boston_trans_keys
	private :_boston_trans_keys, :_boston_trans_keys=
end
self._boston_trans_keys = [
	32, 43, 45, 9, 13, 48, 57, 48, 
	57, 0
]

class << self
	attr_accessor :_boston_single_lengths
	private :_boston_single_lengths, :_boston_single_lengths=
end
self._boston_single_lengths = [
	0, 3, 0
]

class << self
	attr_accessor :_boston_range_lengths
	private :_boston_range_lengths, :_boston_range_lengths=
end
self._boston_range_lengths = [
	0, 2, 1
]

class << self
	attr_accessor :_boston_index_offsets
	private :_boston_index_offsets, :_boston_index_offsets=
end
self._boston_index_offsets = [
	0, 0, 6
]

class << self
	attr_accessor :_boston_trans_targs
	private :_boston_trans_targs, :_boston_trans_targs=
end
self._boston_trans_targs = [
	1, 1, 1, 1, 2, 0, 2, 1, 
	1, 0
]

class << self
	attr_accessor :_boston_trans_actions
	private :_boston_trans_actions, :_boston_trans_actions=
end
self._boston_trans_actions = [
	7, 5, 5, 7, 0, 0, 0, 9, 
	9, 0
]

class << self
	attr_accessor :_boston_to_state_actions
	private :_boston_to_state_actions, :_boston_to_state_actions=
end
self._boston_to_state_actions = [
	0, 1, 0
]

class << self
	attr_accessor :_boston_from_state_actions
	private :_boston_from_state_actions, :_boston_from_state_actions=
end
self._boston_from_state_actions = [
	0, 3, 0
]

class << self
	attr_accessor :_boston_eof_trans
	private :_boston_eof_trans, :_boston_eof_trans=
end
self._boston_eof_trans = [
	0, 0, 9
]

class << self
	attr_accessor :boston_start
end
self.boston_start = 1;
class << self
	attr_accessor :boston_first_final
end
self.boston_first_final = 1;
class << self
	attr_accessor :boston_error
end
self.boston_error = 0;

class << self
	attr_accessor :boston_en_main
end
self.boston_en_main = 1;


# line 17 "tokenizer.rl"
      # % fix sytax
    end

    def tokenize program
      @tokens = []
      data = program
      eof = data.length
      
# line 133 "tokenizer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = boston_start
	ts = nil
	te = nil
	act = 0
end

# line 25 "tokenizer.rl"
      
# line 145 "tokenizer.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_acts = _boston_from_state_actions[cs]
	_nacts = _boston_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _boston_actions[_acts - 1]
			when 1 then
# line 1 "NONE"
		begin
ts = p
		end
# line 179 "tokenizer.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _boston_key_offsets[cs]
	_trans = _boston_index_offsets[cs]
	_klen = _boston_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _boston_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _boston_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _boston_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _boston_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _boston_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	end
	if _goto_level <= _eof_trans
	cs = _boston_trans_targs[_trans]
	if _boston_trans_actions[_trans] != 0
		_acts = _boston_trans_actions[_trans]
		_nacts = _boston_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _boston_actions[_acts - 1]
when 2 then
# line 8 "tokenizer.rl"
		begin
te = p+1
 begin  emit(:OPERATOR, data, ts, te)  end
		end
when 3 then
# line 9 "tokenizer.rl"
		begin
te = p+1
		end
when 4 then
# line 7 "tokenizer.rl"
		begin
te = p
p = p - 1; begin  emit(:NUMBER, data, ts, te)  end
		end
# line 262 "tokenizer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _boston_to_state_actions[cs]
	_nacts = _boston_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _boston_actions[_acts - 1]
when 0 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 282 "tokenizer.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _boston_eof_trans[cs] > 0
		_trans = _boston_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 26 "tokenizer.rl"
      @tokens
    end

    def emit(name, data, start, stop)
      @tokens << [name, data[start...stop]]
    end

  end
end
