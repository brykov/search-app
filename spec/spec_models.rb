# mock model configuration
class User
  declare_enums :flag, :status
end
User.schema = {flag: [true, false], status: %w(active inactive), title: 'string', id: 'number'}.stringify_keys

# emulate empty schema
Organization.schema = {}