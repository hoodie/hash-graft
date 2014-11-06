# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'


describe HashTransformer do

  before do
    @example_1 = {
      "girls" => [
        {"name" => "Marylou"},
        {"name" => "Camilly"},
        {"name" => "Terry"},
        {"name" => "Mary"},
        {"name" => "Rita"},
        {"name" => "Amy"},
      ]}

  end

  describe "#generally" do

    it "initializes" do
      ht = HashTransformer.new
      expect(ht).to be_a HashTransformer
    end

    it "gets" do
      expect(@example_1.get("girls/2/name")).to eq "Terry"
    end

  end

end
