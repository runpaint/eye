describe "Eye.new" do
  
  it "initialises without arguments" do
    lambda{eye = Eye.new}.should_not raise_error
  end
  
  it "creates an instance of Eye" do
    eye = Eye.new
    eye.class.should == Eye
    eye.should.is_a?(Eye)
  end

  it "accepts a ':type => :symbol' argument" do
    lambda{Eye.new(:type => :hash)}.should_not raise_error(ArgumentError)
  end

  it "requires the argument to :type to be a symbol if given" do
    lambda{Eye.new(:type => 1)}.should raise_error(ArgumentError)
    lambda{Eye.new(:type => 'hash')}.should raise_error(ArgumentError)
  end

  it "raises an ArgumentError on unknown keys" do
    lambda{Eye.new(:type => :hash, :f => :g)}.should raise_error(ArgumentError)
    lambda{Eye.new(:f => :bar, :b => :foo)}.should raise_error(ArgumentError)
  end

end
