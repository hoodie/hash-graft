# encoding: utf-8
require 'pp'
require File.dirname(__FILE__) + '/spec_helper'


describe Hash do

  before(:each) do
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
    @example_2 = {
      "bin" => ["bash", "zsh", "git", "vim","ruby"],
      "etc" => ["foo.conf", "bar.ini", ],
      #"home" => { "dean"=>{}, "marylou"=>{}, "sal"=>{}},
      "home" => [ "dean", "marylou", "sal"],
      "usr" => ["share"],
      "var" => {}
    }
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

      it "converts array to hash" do
        #converts
        expect(@example_2['home'].class).to be Array
        @example_2.set_path "/home/dean", ["Pictures"]
        expect(@example_2['home'].class).to be Hash
      end

      it "graft Arrays" do
        gals = @example_1.get_path 'gals'
        guys = @example_1.get_path 'guys'
        gals_fixed = @example_1.get_path 'gals'
        guys_fixed = @example_1.get_path 'guys'
        gals_overwritten = Array.new gals_fixed
        gals_overwritten[0] = guys[0]
        gals_overwritten[1] = guys[1]
        gals_overwritten[2] = guys[2]

        # graft()
        graft1 = gals.graft guys
        expect(gals).to eq gals_fixed

        # graft!()
        graft1 = gals.graft! guys
        expect(gals).to eq gals_overwritten
        expect(graft1).to eq gals_overwritten

        # grafting a bigger on a smaller
        graft2 = guys.graft gals
        expect(graft2).to eq gals

      end

      it "grafts into empty Arrays" do
        expect([].graft [1,2,3,4]).to eq [1,2,3,4]
      end

      it "grafts into empty Hashes" do
        expect({}.graft @example_1).to eq @example_1
      end

      it "grafts via copying Arrays" do
        a = [1,2,3,4]
        b = []
        expect(b.graft a).to eq a
        expect(b).to eq []
        expect(b.graft! a).to eq [1,2,3,4]
        expect(b).to eq [1,2,3,4]
        a[0] = ?x
        expect(a).to eq [?x,2,3,4]
        expect(b).to eq [1,2,3,4]
      end

      it "grafts via copying Hashes" do
        a = {a:?a,b:?b,c:?c,d:?d}
        b = {}
        expect(b.graft a).to eq a
        expect(b).to eq Hash.new
        expect(b.graft! a).to eq a
        expect(b).to eq a
        a[:a] = ?x
        expect(b[:a]). to eq ?a
      end

      it "grafts onto a longer Array" do
        a = [1,2,3,4]
        b = [?a, ?b, ?c]
        expect(a.graft b).to eq [?a,?b,?c,4]
      end

      it "grafts onto a shorter Array" do
        a = [1,2,3,4]
        b = [?a, ?b, ?c]

        expect(b.graft a).to eq [1,2,3,4]
      end

      it "grafts nested Hashes" do
        a = {a:{b:{c:?d}}}
        b = {a:{b:{c:?e},f:?g}}
        expect(a.graft b).to eq b
      end

      it "grafts onto a longer hash" do
        a = {a:?a,b:?b,c:?c,d:?d}
        b = {a:?x,b:?y,c:?z}
        check = {a:?x,b:?y,c:?z,d:?d}
        expect(a.graft b).to eq check
      end

      it "grafts onto a shorter Hash" do
        a = {a:?a,b:?b,c:?c,d:?d}
        b = {a:?x,b:?y,c:?z}
        expect(b.graft a).to eq a
      end

      it "grafts onto a different Hash" do
        a = {a:?a,b:?b,c:?c,d:?d}
        b = {x:?x,y:?y,z:?z}
        c = { y:?y, x:?x, z:?z }
        check = {a:?a,b:?b,c:?c,d:?d,x:?x,y:?y,z:?z}
        expect(b).to eq c
        expect(a.graft b).to eq check 
      end

      it "graft Hashes" do
        example_1_fixed = {}.graft @example_1

        other_characters= {
          "guys" => [
            {"name" => "Winnie"},
            {"name" => "Tigger"},
          ],
        }
        graft1 = @example_1.graft(other_characters)
        expect(graft1['guys']).to eq (other_characters['guys'].clone << {"name" => "Carlo"})
        expect(graft1['gals']).to eq example_1_fixed['gals']

        expect(@example_1).to eq example_1_fixed
        #pp @example_1
        @example_1.graft!(other_characters)
        expect(@example_1['guys']).to eq (other_characters['guys'].clone << {"name"=> "Carlo"})
        expect(@example_1['gals']).to eq example_1_fixed['gals']


      #  expect(true).to be false
      end

      #it "graft Hashes" do
      #  expect(true).to be false
      #end

    end

end
