##: Class that writes a properly formatted PTN file

# number each line
line_number += 1
file.puts "#{line_number}. " + movetext

@tag_pairs = {
	:Site => "",
	:Event => "",
	:Date => "",
	:Time => "",
	:Player_1 => "",
	:Player_2 => "",
	:Clock => "",
	:Result => "",
	:Size => ""
}

def write_tag_pairs
  File.open("match.ptn", "w") do |file|
    tag_pairs.each do |k,v|
      file.puts('[' + k.to_s + " " + '"' + "#{v}" + '"' + ']')
    end
    file.puts("\n")
    line_number = 0
    line_number += 1
    file.puts "#{line_number}. " + move
  end
end

↑
↓
←
→

# placement notation
(stone)(square)

# move notation
(count)(square)(direction)(drop counts)(stone)

# Game end conditions
ROAD_WIN = ["R-0", "0-R"]
FLAT_WIN = ["F-0", "0-F"]
RESIGNATION_WIN = ["1-0", "0-1"]
TIME_WIN = RESIGNATION_WIN
DRAW_WIN = "1/2-1/2"