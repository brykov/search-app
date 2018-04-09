require 'spec_helper'

RSpec.describe User do
  it 'has enums defined' do
    expect(User.get_enums_list).to eq([:verified, :suspended, :shared, :role, :locale, :active])
  end
end
