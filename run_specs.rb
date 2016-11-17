require "find"

test_files = []

Find.find("specs") do |file_path|
  if file_path.include?("_spec.rb")
    test_files.push(file_path)
  end
end

test_files.each_with_index do |file, index|
  puts "Running test: #{File.basename(file)}"
  `ruby #{file}`
end
