require 'spec_helper'

RSpec.describe String do
  it 'should captionify' do
    expect('test_string_id'.captionify).to be_eql 'Test String Id'
  end
end
