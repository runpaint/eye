describe "Eye.seen?" do

  before(:each) do
    @eyes = [:array, :hash, :bloom_filter].map{|t| Eye.new(:type => t)}
  end
  
  it "is a method" do
    @eyes.each do |eye|
      eye.should.respond_to? :seen?
    end  
  end
  
  it "takes a single argument" do
    @eyes.each do |eye|
      lambda{eye.seen?("string")}.should_not raise_error
    end  
  end
  
  it "raises an ArgumentError if called without arguments" do
    @eyes.each do |eye|
      lambda{eye.seen?}.should raise_error(ArgumentError)
    end  
  end
  
  it "raises an ArgumentError if called with more than one argument" do
    @eyes.each do |eye|
      lambda{eye.seen?(1,2)}.should raise_error(ArgumentError)
      lambda{eye.seen?("str",['g'],"bar")}.should raise_error(ArgumentError)
    end
  end
  
  it "returns true if .see(obj) has been called previously" do
    @eyes.each do |eye|
      ['Kim', 'http://example.com/'].each do |obj|
        eye.see obj
        eye.seen?(obj).should == true
      end
      eye.seen?('Kim').should == true
    end
  end
  
  it "returns false unless .see(obj) has been called previously" do  
    @eyes.each do |eye|
      ['The Tao of Pooh', 29, 30.3].each do |obj|
        eye.seen?(obj).should == false
      end
      eye.seen?(29).should == false
    end  
  end

end
