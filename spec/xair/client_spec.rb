require "xair/client"

RSpec.describe Xair::Client do

  context "#initialize" do
    it "allows no params" do
      expect(Xair::Client.new).to be_kind_of(Xair::Client)
    end
    it "takes a hash" do
      expect(Xair::Client.new({})).to be_kind_of(Xair::Client)
    end
    it "sets the host" do
      client = Xair::Client.new(:host => "test-host")
      expect(client.instance_eval("@host")).to eq("test-host")
    end
    it "sets the port" do
      client = Xair::Client.new(:port => 12324)
      expect(client.instance_eval("@port")).to eq(12324)
    end
    it "sets a default host" do
      client = Xair::Client.new
      expect(client.instance_eval("@host")).to eq("192.168.1.101")
    end
    it "sets a default port" do
      client = Xair::Client.new
      expect(client.instance_eval("@port")).to eq(3333)
    end

  end

end

