# encoding: utf-8
require 'pp'
require File.dirname(__FILE__) + '/spec_helper'


describe HashTransformer do

  before do
    @example_1 = {
      "guys" => [
        {"name" => "Dean"},
        {"name" => "Sal"},
        {"name" => "Carlo"},
      ],
      "gals" => [
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


  end
  describe "#hashmixins" do
    describe "#get_path" do

      it "gets simple" do
        expect(@example_1.get_path("gals/2/name")).to eq "Terry"
      end

      it "gets many with *" do
        expect(@example_1.get_path("gals/*/name")).to eq [
          "Marylou","Camilly","Terry","Mary","Rita","Amy"
        ]
      end

    end
  end

end
