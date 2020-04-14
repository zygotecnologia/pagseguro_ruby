module PagSeguro
  class CreditCardTransactionRequest < TransactionRequest
    # Set credit card token.
    # Required for credit card payment method.
    attr_accessor :credit_card_token

    # Get installment info.
    attr_reader :installment

    # Get credit card holder info.
    attr_reader :holder

    # Get billing address info.
    attr_reader :billing_address

    # Get the payment_method.
    def payment_method
      "creditCard"
    end

    def payment_mode
      "default"
    end

    # Set the installment.
    # Required for credit card payment method.
    def installment=(installment)
      @installment = ensure_type(TransactionInstallment, installment)
    end

    # Set the credit card holder.
    # Required for credit card payment method.
    def holder=(holder)
      @holder = ensure_type(Holder, holder)
    end

    def primary_receiver=(primary_receiver)
      @primary_receiver = ensure_type(PrimaryReceiver, primary_receiver)
    end

    # Set the billing address.
    # Required for credit card payment method.
    def billing_address=(address)
      @billing_address = ensure_type(Address, address)
    end
  end
end
