module PagSeguro
  class Shipping
    # Set the available shipping type.
    TYPE = {
      pac: 1,
      sedex: 2,
      not_specified: 3
    }

    # Define the error class for invalid type assignment.
    InvalidShippingTypeError = Class.new(StandardError)

    include Extensions::Assignment
    include Extensions::EnsureType

    attr_reader :type_id
    attr_reader :type_name
    attr_reader :address

    attr_accessor :cost
    attr_accessor :address_required

    # Set the shipping address info.
    def address=(address)
      @address = ensure_type(Address, address)
    end

    def address_required=(address_required)
      @address_required = address_required
    end

    # Set the shipping type.
    # It raises the PagSeguro::Shipping::InvalidShippingTypeError exception
    # when trying to assign an invalid type name.
    def type_name=(type_name)
      type_name = type_name.to_sym
      @type_id = TYPE.fetch(type_name) {
        raise InvalidShippingTypeError, "invalid #{type_name.inspect} type name"
      }
      @type_name = type_name
    end

    # Set the shipping type id.
    # It raises the PagSeguro::Shipping::InvalidShippingTypeError exception
    # when trying to assign an invalid type id.
    def type_id=(id)
      type_id = id.to_i

      raise InvalidShippingTypeError,
        "invalid #{id.inspect} type id" unless TYPE.value?(type_id)

      @type_id = type_id
      @type_name = TYPE.key(type_id)
    end
  end
end
