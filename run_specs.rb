require "find"

def in_specs_dir?
  Dir.getwd.split("/").last == "specs"
end

def get_specs_current_dir
  test_files = []
  Dir.foreach(".") do |file_path|
    if file_path.include?("_spec.rb")
      test_files << file_path
    end
  end
  return test_files
end

def get_specs_sub_dir
  unless File.directory?("specs")
    puts "\e[1;35mNo 'specs' directory found.\e[0m"
    return []
  end
  test_files = []
  Find.find("specs") do |file_path|
    if file_path.include?("_spec.rb")
      test_files << file_path
    end
  end
  return test_files
end

def get_spec_files
  in_specs_dir? ? get_specs_current_dir : get_specs_sub_dir
end

def all_passing?(result_lines)
  short_result = result_lines.last
  result_by_type = short_result.split(", ")
  failures_string = result_by_type[2]
  errors_string = result_by_type[3]
  num_failures = failures_string.split(" ").first.to_i
  num_errors = errors_string.split(" ").first.to_i
  num_failures == 0 && num_errors == 0
end

def format_passing(result_lines)
  short_result = result_lines.last
  return "\e[1;32m#{short_result}\e[0m"
end

def format_failing(result_lines)
  symbols = format_symbols(result_lines[4])
  error_output = result_lines[7..-2]
  summary = "\e[1;31m#{result_lines.last}\e[0m"

  output = [symbols, error_output, summary]
  output.join("\n")
end

def format_symbols(symbols)
  colourised = symbols.split("").map do |char|
    char == "." ? "\e[1;32m#{char}\e[0m" : "\e[1;31m#{char}\e[0m"
  end
  colourised.join("")
end

def run_tests spec_files
  spec_files.each do |file|
    file_name = File.basename(file)
    puts "Running: \e[1;95m#{file_name}\e[0m " + ("-" * (54 - file_name.size))
    test_result = `ruby #{file}`
    result_lines = test_result.split("\n")

    if result_lines.size > 0
      if all_passing?(result_lines)
        puts format_passing(result_lines)
      else
        puts format_failing(result_lines)
      end
    end
  end
end

files = get_spec_files()

run_tests(files)
