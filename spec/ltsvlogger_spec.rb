# coding: utf-8
require_relative "spec_helper"
require "stringio"

describe Rack::LTSVLogger do
  def app
    Rack::LTSVLogger.new(FakeApp.new, @output)
  end

  def ltsv_data
    @output.seek(0)
    Hash[@output.read.chomp.split("\t").map{|v| v.split(":", 2)}]
  end
  
  before do
    @output = StringIO.new
  end

  describe "#log" do
    it "LTSV フォーマットでログを出力できる" do
      get "/"
      expect(ltsv_data["host"]).to eq("127.0.0.1")
      expect(ltsv_data["forwardedfor"]).to eq("-")
      expect(ltsv_data["user"]).to eq("-")
      expect(ltsv_data["method"]).to eq("GET")
      expect(ltsv_data["path"]).to eq("/")
      expect(ltsv_data["query"]).to eq("")
      expect(ltsv_data["status"]).to eq("200")
    end
  end
end

