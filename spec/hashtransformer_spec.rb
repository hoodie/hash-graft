# encoding: utf-8
require 'pp'
require File.dirname(__FILE__) + '/spec_helper'


describe HashTransformer do
  describe "#generally" do

    it "initializes" do
      ht = HashTransformer.new
      expect(ht).to be_a HashTransformer
    end


  end
end
