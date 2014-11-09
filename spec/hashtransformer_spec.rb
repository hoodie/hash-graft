# encoding: utf-8
require 'pp'
require File.join File.dirname(__FILE__), 'spec_helper.rb'


describe HashTransformer do
  describe "#generally" do

    it "initializes" do
      ht = HashTransformer.new
      expect(ht).to be_a HashTransformer
    end


  end
end
