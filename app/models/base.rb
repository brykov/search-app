# Base class for searchable models
class Base
  class << self
    attr_accessor :schema

    # Defines a list of attribute names that should behave as enums
    def declare_enums(*field_names)
      @_enums = field_names
    end

    def get_enums_list
      @_enums || []
    end

  end

end