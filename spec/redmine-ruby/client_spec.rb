require 'spec_helper'

describe Redmine::Client do


  context "initialization" do
    it "should take a debug option that when true loads a Logger" do
      client = Redmine::Client.new('https://dummy.com', 'dummytoken', true)
      expect(client.debug).to be_true
      expect(client.api.connection.builder.handlers).to include(Faraday::Response::Logger)
    end

    it "should take a debug option that defaults to false and when false does not load a Logger" do
      client = Redmine::Client.new('https://dummy.com', 'dummytoken')
      expect(client.debug).to be_false
      expect(client.api.connection.builder.handlers).to_not include(Faraday::Response::Logger)
    end
  end

  context "resources" do
    let(:client) { Redmine::Client.new('http://dummy-url.com', 'dummytoken') }
    
    it "should have projects" do
      expect(client).to respond_to(:projects)
    end

    it "should have enumerations" do
      expect(client).to respond_to(:enumerations)
    end

    it "should have issue_statuses" do
      expect(client).to respond_to(:issue_statuses)
    end

    it "should have issue_categories" do
      expect(client).to respond_to(:issue_categories)
    end

    it "should have trackers" do
      expect(client).to respond_to(:trackers)
    end

    it "should have custom_fields" do
      expect(client).to respond_to(:custom_fields)
    end

    it "should have issues" do
      expect(client).to respond_to(:issues)
    end

    it "should have versions" do
      expect(client).to respond_to(:versions)
    end

    it "should have uploads" do
      expect(client).to respond_to(:uploads)
    end

    it "should have time_entries" do
      expect(client).to respond_to(:time_entries)
    end

  end

end