#wario's fat
wtotal=0
3.times do
  start=Time.now
 score = Score.create(title: "wario's fat", music_xml: "/Users/spencerolson/Desktop/wario.xml")
wtotal+=Time.now-start
end

#zelda
total=0
3.times do
  start=Time.now
 score = Score.create(title: "zelda's fat", music_xml: "/Users/spencerolson/Desktop/zelda.xml")
total+=Time.now-start
end
puts "wario avg is #{wtotal/3}"
puts "zelda avg is #{total/3}"