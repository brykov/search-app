class Ticket < Base
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  declare_enums :priority, :status, :type, :has_incidents, :via
end
