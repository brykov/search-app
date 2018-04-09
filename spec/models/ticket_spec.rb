require 'spec_helper'

RSpec.describe Ticket do
  it 'has enums defined' do
    expect(Ticket.get_enums_list).to eq([:priority, :status, :type, :has_incidents, :via])
  end
end
