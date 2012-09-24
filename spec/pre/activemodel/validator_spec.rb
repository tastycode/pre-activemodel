require 'spec_helper'
describe Pre::ActiveModel::Validator do
  context "works with validates_with" do
    it "delegates the class PreValidator to Pre::ActiveModel::Validator" do
      person = Class.new do
        include ActiveModel::Validations
        attr_accessor :email_address
        validates :email_address, :pre => true
      end
      john = person.new
      john.email_address = "wrong@example"
      john.should_not be_valid
    end

    it "passes configuration options to the validator instance" do
      person = Class.new do
        include ActiveModel::Validations
        attr_accessor :email_address
        validates :email_address, :pre => {:validators => [ lambda { |address|
          address =~ /^w/
        }]}
      end

      john = person.new
      john.email_address = "wrong@example"
      john.should be_valid

      karen = person.new
      karen.email_address = "foo@example.com"
      karen.should_not be_valid
    end
  end
end
