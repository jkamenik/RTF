require 'spec_helper'

describe Io do
  context 'capture' do
    it 'should return 3 items, block return value, stdout, and stdin' do
      values = Io.capture {
        puts 'out'
        warn 'err'
        4
      }
      values.class.should == Array
      values[0].should == 4
      values[1].should == "out\n"
      values[2].should == "err\n"
    end
    
    it 'should capture stdout' do
      values = Io.capture {
        puts 'test'
      }
      values[1].should == "test\n"
    end
    
    it 'should capture stderr' do
      values = Io.capture {
        warn 'test'
      }
      values[2].should == "test\n"
    end
    
    it 'should not catch exceptions' do
      lambda {Io.capture do raise RuntimeError; end}.should raise_error RuntimeError
    end
    
    it 'should ensure stdio is returned to the correct state' do
      lambda {
        Io.capture do
          $stdout.class.should == StringIO
          $stderr.class.should == StringIO
          raise RuntimeError
        end
      }.should raise_error RuntimeError
      $stdout.class.should == IO
      $stdout.class.should == IO
    end
  end
end