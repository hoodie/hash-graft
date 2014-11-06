# -*- encoding: utf-8 -*-
require 'rubygems' unless defined? Gem
require File.dirname(__FILE__) + "/lib/hashtransformer/version"

Gem::Specification.new do |s|
  s.name        = "hashtransformer"
  s.version     = Hashtransformer::VERSION
  s.authors     = ["Hendrik Sollich"]
  s.email       = "hendrik@hoodie.de"
  s.homepage    = "https://github.com/hoodie/hashtransformer"
  s.summary     = "transforms hashes"
  s.description = "transforms hashes from one form into another"
  s.required_ruby_version     = '>= 2.1'
  s.files = ['lib/hashtransformer.rb', 'lib/hashtransformer/version.rb']
  s.extra_rdoc_files = ["README.md", "LICENSE.md"]
  s.license = 'GPL'
end
