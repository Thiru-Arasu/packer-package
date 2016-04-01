require 'rainbow'

task :default => [:validate]

desc 'Validate all the packer templates'
task :validate do
    puts Rainbow("make test").green
    unless system "make test"
      puts Rainbow("Building packages failed").red
      fail "Could not build packages"
    end
end

