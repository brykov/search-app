class ConvertParamsToCriteria
  def self.run(model, params)
    criteria = {}
    model.schema.each do |attribute_name, spec|
      if params.has_key?(attribute_name) and !params[attribute_name].empty?
        value = params[attribute_name]

        # cast value as True or False if corresponding spec is an array and contains True
        value = (value == 'true') if spec.is_a?(Array) and spec.include?(true)

        # omit value that is not permitted by specification
        next if spec.is_a?(Array) and !spec.include?(value)

        # cast value as integer if corresponding spec defines it as "number"
        value = value.to_i if spec == 'number'

        criteria[attribute_name] = value
      end
    end
    criteria
  end
end