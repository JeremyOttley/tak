require 'mustache'

Mustache.template_file = File.dirname(__FILE__) + '/ptn.mustache'

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
