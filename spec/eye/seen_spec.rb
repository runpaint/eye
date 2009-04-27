describe "Eye.seen?" do

  before(:each) do
    @eye = Eye.new
  end
  
  it "is a method" do
    @eye.should.respond_to? :seen?
  end
  
  it "takes a single argument" do
    lambda{@eye.seen?("string")}.should_not raise_error
  end
  
  it "raises an ArgumentError if called without arguments" do
    lambda{@eye.seen?}.should raise_error(ArgumentError)
  end
  
  it "raises an ArgumentError if called with more than one argument" do
    lambda{@eye.seen?(1,2)}.should raise_error(ArgumentError)
    lambda{@eye.seen?("string",['glark'],"bar")}.should raise_error(ArgumentError)
  end
  
  it "returns true if .see(obj) has been called previously" do
    [:array, :hash].each do |type|
      eye = Eye.new(:type => type)
      ['Kim', 'http://example.com/'].each do |obj|
        eye.see obj
        eye.seen?(obj).should == true
      end
      eye.seen?('Kim').should == true
    end
  end
  
  it "returns false unless .see(obj) has been called previously" do  
    [:array, :hash].each do |type|
      eye = Eye.new(:type => type)
      ['The Tao of Pooh', 29, 30.3].each do |obj|
        eye.seen?(obj).should == false
      end
      eye.seen?(29).should == false
    end  
  end

end
