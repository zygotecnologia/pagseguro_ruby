module PagSeguro
  class PrimaryReceiver
    include Extensions::Assignment
    include Extensions::EnsureType

    attr_accessor :email
    attr_accessor :public_key
  end
end
