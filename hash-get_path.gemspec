# -*- encoding: utf-8 -*-
require 'rubygems' unless defined? Gem
require File.dirname(__FILE__) + "/lib/hash-graft/version"

Gem::Specification.new do |s|
  s.name        = "hash-graft"
  s.version     = Hash:Graft::VERSION
  s.authors     = ["Hendrik Sollich"]
  s.email       = "hendrik@hoodie.de"
  s.homepage    = "https://github.com/hoodie/hash-graft"
  s.summary     = "Hash::graft(another_hash)"
  s.description = "
  Allows to graft one hash onto another.
  Also implements Hash::get_path('/path/trough/your/structure')
  and Hash::set_path('change/value/foo/to', 'bar').

  See examples on github.
  "
  s.required_ruby_version     = '>= 2.1'
  s.files = ['lib/hash-graft.rb', 'lib/hash-graft/version.rb']
  s.extra_rdoc_files = ["README.md", "LICENSE.md"]
  s.license = 'GPL'
end
