require 'spec_helper'
require 'spec_models'

RSpec.describe ConvertParamsToCriteria do
  it 'returns hash of parameters' do
    criteria = ConvertParamsToCriteria.run(User, {'flag' => 'true', 'status' => 'active'})
    expect(criteria).to be_a(Hash)
    expect(criteria).to have_key('flag').and have_key('status')
  end

  it 'omits parameters that are not defined by the scheme' do
    criteria = ConvertParamsToCriteria.run(User, {'flag' => 'true', 'status' => 'active', 'nonexistent' => 'foo'})
    expect(criteria).to_not have_key('nonexistent')
    expect(criteria.keys.count).to eq(2)
  end

  it 'casts types' do
    criteria = ConvertParamsToCriteria.run(User, {'flag' => 'true', 'id' => '123'})
    expect(criteria['flag']).to be_a(TrueClass)
    expect(criteria['id']).to be_a(Numeric)
  end

  it 'omits unsupported enum values' do
    criteria = ConvertParamsToCriteria.run(User, {'flag' => 'true', 'status' => 'nonexistent'})
    expect(criteria).to_not have_key('status')
    expect(criteria.keys.count).to eq(1)
  end
end