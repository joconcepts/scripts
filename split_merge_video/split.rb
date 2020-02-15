#!/usr/bin/env ruby

output_list = File.open("output.txt", "w+")
output_list.truncate(0)

File.readlines("input.txt").map do |line|
  line.strip!
  start, ende = line.split("-")
  start, ende = [start, ende].map! do |time|
    minute, second = time.split(":").map(&:to_i)
    minute*60 + second
  end
  {start: start, ende: ende}
end.each.with_index do |part, index|
  output = "teil_#{index+1}.mp4"
  `ffmpeg -i source.mp4 -ss #{part[:start]} -t #{part[:ende]-part[:start]} #{output}`
  output_list.write("file './#{output}'\n")
end
output_list.close
