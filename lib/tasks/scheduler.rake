desc "This task will remove all unfinished lines"
task :destroy_lines => :environment do
  puts "Destroying lines..."
  Line.where('created_at <= ? AND done = false', 15.minutes.ago).destroy_all
  puts "done."
end
