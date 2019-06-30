class Ptn

    attr_accessor :matchdata
    
  def initialize(notation)
    @matchdata = notation.match(/(?<piece_count>\d)?(?<special_piece>[CS])?(?<column>[a-h])(?<row>[1-8])((?<movement>[<>+-])(?<distribution>[1-8]+)?(?<wall_smashed>\*)?)?/)
  end

raise "Invalid PTN format' unless @matchdata"

matchdata[:piece_type] = matchdata[:special_piece] === 'C' ? 'capstone' : 'piece'

end

