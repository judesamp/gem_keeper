require 'rspec'
require './app.rb'

describe GemKeeper do

  context 'initialization' do
  
  let(:gem) { GemKeeper.new(name: "name", description: "description", url: "url", user_gem: true)}


    it "should have a name" do
      expect(gem.name).to eq "name"
    end 

    it "should have a description" do
      expect(gem.description).to eq "description"
    end

    it "should have a url" do
      expect(gem.url).to eq "url"
    end

    it "should be set as a user gem" do
      expect(gem.user_gem).to eq true
    end

  end

  
######### previous iteration ##########
  # it "should have gems" do
  #   GemKeeper.gems.should_not be_empty
  # end

  # it "should return three random gems" do
  #   GemKeeper.random_gems.length.should eq 3
  # end

  # it "should have an empty array of user gems" do
  #   GemKeeper.user_gems.should be_empty
  # end

  # it "should reject blank user gem submissions" do
  #   GemKeeper.add_user_gem('')
  #   GemKeeper.user_gems.should be_empty
  # end

  # it "should reject user gem submissions that aren't a part of gemset" do
  #   GemKeeper.add_user_gem('hammertime')
  #   GemKeeper.user_gems.should be_empty
  # end

  # it "should add user gems" do
  #   first_count = GemKeeper.user_gems.count
  #   GemKeeper.add_user_gem('rack')
  #   second_count = GemKeeper.user_gems.count
  #   second_count.should be > first_count
  # end

  # it "should add everything added via the .add_with_zen method" do
  #   GemKeeper.add_with_zen('anything')
  #   expect(GemKeeper.user_gems.include?('anything')).to eq true
  # end

end