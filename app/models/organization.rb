class Organization < Base
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  declare_enums :shared_tickets
end
