class Base
  class << self
    attr_accessor :schema

    def declare_enums(*field_names)
      @_enums = field_names
    end

    def get_enums_list
      @_enums || []
    end

  end

end