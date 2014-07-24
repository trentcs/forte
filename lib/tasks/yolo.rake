desc 'Fuck it. Try again.'
task "db:yolo" => [:"db:drop", :"db:create", :"db:migrate"] do
  puts "YOLO MOFOS"
end