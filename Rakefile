GEMSPEC = 'euro.gemspec'

#require 'rake'
#require 'rake/rdoctask'
require 'fileutils'
require 'rspec/core/rake_task'

task :default => :spec
task :test    => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = [
    '--colour',
    '--format documentation',
    '--fail-fast',
    '-r ' + File.expand_path( File.join( 'spec', 'spec_helper') ),
  ]
end

def gemspec
  @gemspec ||= eval(File.read(GEMSPEC), binding, GEMSPEC)
end

desc "Build the gem"
task :gem => :gemspec do
  sh "gem build #{GEMSPEC}"
  FileUtils.mkdir_p 'pkg'
  FileUtils.mv "#{gemspec.name}-#{gemspec.version}.gem", 'pkg'
end

desc "Install the gem locally"
task :install => :gem do
  sh %{gem install pkg/#{gemspec.name}-#{gemspec.version}.gem --no-rdoc --no-ri}
end

desc "Generate the gemspec"
task :generate do
  puts gemspec.to_ruby
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end
