require 'spec_helper'

class ClassWithEnumAttributes < Base
  declare_enums :alpha, :beta, :omega
end

RSpec.describe Base do
  it 'defines enum attributes' do
    expect(ClassWithEnumAttributes.instance_variable_defined?(:@_enums)).to be true
    expect(ClassWithEnumAttributes.instance_variable_get(:@_enums)).to eq([:alpha, :beta, :omega])
  end

  it 'returns list of enum attributes' do
    expect(ClassWithEnumAttributes.get_enums_list).to eq([:alpha, :beta, :omega])
  end
end
