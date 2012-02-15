require 'lettuce'

describe Lettuce do
  before do
    # Set up fixture stuff
  end

  it 'should return nil if no recipes are found' do
    Lettuce.parse("http://tomrudick.com").should == nil
  end
end