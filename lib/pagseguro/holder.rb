module PagSeguro
  class Holder
    include Extensions::Assignment
    include Extensions::EnsureType

    # Set the name.
    attr_accessor :name

    # Set the birth date.
    attr_accessor :birth_date

    # Get document info.
    attr_reader :document

    # Get the phone.
    attr_reader :phone

    # Get the billing address
    attr_reader :billing_address

    def documents
      @documents ||= Documents.new
    end

    def documents=(_documents=[])
      _documents.each do |document|
        documents << document
      end
    end

    # Set the sender document.
    def document=(document)
      documents << ensure_type(Document, document)
    end

    # Set the phone.
    def phone=(phone)
      @phone = ensure_type(Phone, phone)
    end

    # Set the billing address
    def billing_address=(billing_address)
      @billing_address = ensure_type(Address, billing_address)
    end
  end
end
