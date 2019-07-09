require "mustache"

Mustache.template_file = File.dirname(__FILE__) + "/ptn_header.mustache"

ptn = Mustache.new

ptn[:Site] = "Baltimore"
ptn[:Event] = "Regionals"
ptn[:Date] = "2018.10.28"
ptn[:Time] = "16:10:44"
ptn[:Player1] = "Jeremy Ottley"
ptn[:Player2] = "Gillian Parent"
ptn[:Clock] = "10:0 +20"
ptn[:Result] = "R-0"
ptn[:Size] = "5"

File.open("match.ptn", "w") do |file|
  file.puts(ptn.render)
  file.puts("\n")
end

##

File.open("match.ptn", "a+") do |file|
 move_hash = {
  1 => "a6 f6",
  2 => "d4 c4",
  3 => "d3 c3",
  4 => "d5 c5",
  5 => "d2 Ce4",
  6 => "c2 e3",
  7 => "e2 b2",
  8 => "Cb3 1e4<1",
  9 => "1d3<1 Sd1",
  10 => "a3 1d1+1",
}
  move_hash.each {|k,v| file.puts "#{k}. #{v}" + "\n"}
end
