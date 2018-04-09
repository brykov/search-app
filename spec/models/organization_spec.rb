require 'spec_helper'

RSpec.describe Organization do
  it 'has enums defined' do
    expect(Organization.get_enums_list).to eq([:shared_tickets, :details])
  end
end
