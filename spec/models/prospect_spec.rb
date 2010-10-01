require 'spec_helper'

describe Prospect do
  before do
    @prospect = Prospect.new(:firstname => 'ken', :email => 'e@mail.com')
  end

  it "is valid with valid attributes" do
    @prospect.should be_valid
  end

  it "is valid with or without phone" do
    @prospect.phone = nil
    @prospect.should  be_valid

    @prospect.phone = '09278433149'
    @prospect.should be_valid
  end

  context "firstname" do
    it "is not valid if blank" do
      @prospect.firstname = nil
      @prospect.should_not be_valid
    end

    it "is not valid if format is invalid" do
      ['Jose Ma.', 'Ma. Fe', 'Kenneth', 'KC', 'Johnny Boy', 'Ke-ko'].each do |name|
        @prospect.firstname = name
        @prospect.should be_valid
      end

      ['1K', 'K1', '.K', '-K', '.-K', '..K', '--K', 'K-', 'K..'].each do |name|
        @prospect.firstname = name
        @prospect.should_not be_valid
      end
    end
  end

  context "email" do
    it "is not valid if blank" do
      @prospect.email = nil
      @prospect.should_not be_valid
    end

    it "is not valid if format is invalid" do
      ['k_c@mail.com', 'k+c@mail.com', 'k.c@mail.com', 'kc7@mail.com'].each do |email|
        @prospect.email = email
        @prospect.should be_valid
      end

      ['0k7@m.com', '007@mail.com'].each do |email|
        @prospect.email = email
        @prospect.should_not be_valid
      end
    end
  end
end
