# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'


describe HashTransformer do

  before do
    @example_1_before = {"user" =>{"name" => "marylou"}}
    @example_1_after  = {"user_name" => "marylou"}

  end

  describe "#generally" do

    it "initializes" do
      ht = HashTransformer.new
      expect(ht).to be_a HashTransformer
    end

  end

end
