class Board

  attr_accessor :size

  def initialize(size = 5)
    @size = size
    @state = mda(@size, @size)
    @history = []
  end

  def move(ptn, color = 'w')
    if isValid(ptn, color)
      [false, *@errors]
  end

  stack = []

  moveset = ptn.to_moveset
