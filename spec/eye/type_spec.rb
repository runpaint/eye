describe "Eye.type" do

  it "is a method" do
    eye = Eye.new
    eye.should.respond_to? :type
    eye = Eye.new(:type => :array)
    eye.should.respond_to? :type
  end
 
  it "takes no arguments" do
    eye = Eye.new
    lambda{eye.type("string")}.should raise_error(ArgumentError)
    eye = Eye.new
    lambda{eye.type(1,'f',[])}.should raise_error(ArgumentError)
  end

  it "returns :hash when no type is specified in the constructor" do
    eye = Eye.new
    eye.type.should == :hash
  end

  it "returns the value of :type when given in the constructor" do
    eye = Eye.new(:type => :hash)
    eye.type.should == :hash
    eye = Eye.new(:type => :array)
    eye.type.should == :array
  end

  it "returns a Symbol" do
    eye = Eye.new
    eye.type.is_a?(Symbol).should == true
  end 

  it "causes a Hash to be used as the eye if equal to :hash" do
    eye = Eye.new(:type => :hash)
    eye.eye.is_a?(::Hash).should == true
    eye = Eye.new
    eye.eye.is_a?(::Hash).should == true  
  end

  it "causes an Array to be used as the eye if equal to :array" do
    eye = Eye.new(:type => :array)
    eye.eye.is_a?(Array).should == true
  end

  it "causes a BloomFilter to be used as the eye if equal to :bloom_filter" do
    eye = Eye.new(:type => :bloom_filter)
    eye.eye.is_a?(BloomFilter).should == true
  end
end

