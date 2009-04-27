describe "Eye.eye" do

  it "is a method" do
    eye = Eye.new
    eye.should.respond_to? :eye
  end
 
  it "takes no arguments" do
    eye = Eye.new
    lambda{eye.eye("string")}.should raise_error(ArgumentError)
    eye = Eye.new
    lambda{eye.eye(1,'f',[])}.should raise_error(ArgumentError)
  end

  it "returns the object being used as the eye" do
    eye = Eye.new
    eye.eye.is_a?(Hash).should == true
  end

end

