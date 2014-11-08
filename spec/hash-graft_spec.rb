# encoding: utf-8
require 'pp'
require File.dirname(__FILE__) + '/spec_helper'


describe Hash do

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

  describe "#Mixins" do

      it "simply get a path" do
        expect(@example_1.get_path("gals/2/name")).to eq "Terry"
      end

      it "gets many with *" do
        expect(@example_1.get_path("gals/*/name")).to eq [
          "Marylou","Camilly","Terry","Mary","Rita","Amy"
        ]
      end

      it "simply set a path" do
        expect(@example_1.get_path("gals/0/name")).to eq "Marylou"
        expect(@example_1.set_path("gals/0/name", "Mary Lou")).to be_truthy
        expect(@example_1.get_path("gals/0/name")).to eq "Mary Lou"
      end

      it "graft Arrays" do
        expect(true).to be false
      end

      it "graft Hashes" do
        expect(true).to be false
      end

    end

end
