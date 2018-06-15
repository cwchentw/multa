require "bundler/gem_tasks"

task :default do
  Dir.entries("./tests").each do |t|
      next if t == "." or t == ".."
      sh "bundle exec ruby tests/#{t}"
  end
end
