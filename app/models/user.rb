class User < Base
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  declare_enums :verified, :suspended, :shared, :role, :locale, :active
end
