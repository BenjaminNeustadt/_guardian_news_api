require "spec_helper"
require "rack/test"
require "capybara/rspec"
require_relative '../../app'

describe Application do
  
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /" do

    it "returns 200 OK" do
      response = get("/")
      expect(response.status).to eq(200)
    end
  end

  context "page" do

    it "has button" do
      response = get("/")
      expect(response.body).to include("button")
    end

    it "has content or no data message" do
      response = get("/")
      expect(response.body).to include("ul")
    end

  end

end
