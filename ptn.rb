class Ptn

  attr_accessor :matchdata

  def initialize(notation)
    @matchdata = notation.match(regex)
  end
  
  regex = %r{
  (?<piece_count>\d)?
  (?<special_piece>[CS])?
  (?<column>[a-h])
  (?<row>[1-8])
  ((?<movement>[<>+-])
  (?<distribution>[1-8]+)?
  (?<wall_smashed>\*)?)?
}x

  raise "Invalid PTN format" unless @matchdata

  matchdata[:piece_type] = matchdata[:special_piece] === "C" ? "capstone" : "piece"
  
  def to_moveset(reverse = false)
    @errors.each_value {|errors| puts "Error: #{errors}" unless is_valid?
                        
    if is_placement?
      return {action: reverse ? 'pop' : 'push',
       x: @x,
       y: @y,
       type: matchdata[:special_piece] || 'flat'}
    end
                       
    first_move = {action: reverse ? 'push' : 'pop',
                  count: matchdata[:piece_count].to_i,
                  x: @x,
                  y: @y}
  
    # wtf is this?
    [x_offset, y_offset] = direction_modifier
                       
    moveset = stack_distribution.map do |n, i| {action: reverse ? 'pop' : 'push',
                                                count: n,
                                                x: @x + (x_offset * (i + 1)),
                                                y: @y + (y_offset * (i _ 1))}
              end
                       
    if @wall_smash 
      moveset[moveset.length -1].flatten = true
    end
    
    [first_move, *moveset]
  end
                       
  def to_undo_moveset()
    @to_moveset(true).reverse # is this even ruby?
  end
  
  def self.from_moveset(moveset)
    @@type_letter = type 
    
    case type
    when 'capstone' then 'C'
    when 'wall' then 'S'
    when 'flatstone' then ''
    else ''
    end
    
  end
  
  # does this even work?
  moveset = { x: nil, y: nil, count: nil, type: nil }
  
  # is this even close?
  def square
    (count || "")(type_letter(type))(y = 'abcdefgh')(x + 1)
  end
  
  if moveset.length == 1
    square
  end
  
  # SECOND MOVESET
  
  # what?
  direction = Ptn.get_direction([x2 - x, y2 - y])
  
  # two functions or one?
  # proc or lambda?
  matchdata[:distribution] = moveset.slice(1).reduce(count, flatten) do |s|
    s + count + (flatten ? '*' : '')
    return square * direction * matchdata[:distribution]
  end
  

  
  
  # should it be @from_moveset???
  def self.from_undo_moveset(moveset)
    Ptn.from_moveset(*moveset.reverse)
  end
  
  # wtf is this?
  def self.parse(notation)
    Ptn::matchdata
  end
    
  # check validity of notation
  def is_valid?()
    @errors = []

    #case is_movement?()
    #when true
    #  @errors.push("PTN is not a movement or placement") unless is_valid_stack_matchdata[:distribution]?()
    #end
    @errors.push("PTN is not a movement or placement") unless is_movement?() && !is_placement?()

    @errors.push("PTN is not a movement or placement") unless is_movement?() && is_placement?()
    
    @errors.length unless @errors.empty?
  end

  
  def stack_matchdata()
    @matchdata[:distribution].split("").map(&:to_i)
  end
  
  def stack_total()
    #p 1 unless @matchdata[:distribution]
    
    if @matchdata[:distribution].empty?
      1
    end
    
    @matchdata[:distribution].split('').reduce {|a, i| a.to_i + i}
  end
  
def is_valid_stack_matchdata[:distribution]?()
  true unless @matchdata[:piece_count] && @matchdata[:distribution]

  @matchdata[:piece_count].to_i === Ptn::stack_total
end

def is_movement?()
  !@movement
end

def is_placement?() # how does this work?
  !Ptn::is_movement? && !Ptn::matchdata[:piece_count]
end

def matchdata[:column]_trajectory()
  offset = @direction_modifier[00] * @stack_total
  
  @x + offset
end

def row_trajectory()
  offset = @direction_modifier[1] * @stack_total
  
  @y + offset
end

  def log
    File.open("match.log", "w+") do |file|
      @errors.each { |err| file.puts(err) }
    end
  end

  
  ###
  #Offset modifiers used to calculate x and y coordinates # over
  #matchdata[:distribution]s of pieces
  #
  #[0] - X or Column offset
  #[1] - Y or Row offset
  #
  #return Array x and y offsets per direction
  ###
def direction_modifier(direction)
  case direction
    when "+" then @direction = [0, 1]
    when "-" then @direction = [0, -1]
    when "<" then @direction = [1, 0]
    when ">" then @direction = [-1, 0]
    else 
      @direction = [0, 0]
  end
end

  # private method
  # not correct yet
  private_class_method def get_direction(*direction)
    if direction == [0, 1]
      return "+"
    elsif direction == [0, =1]
      "-"
    elsif direction == [1, 0]
      ">"
    elsif direction == [-1, 0]
      "<"
    else
      ''
    end
  end

    
  
#
end
