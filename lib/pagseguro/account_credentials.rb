module PagSeguro
  class AccountCredentials
    # The account app_id
    attr_accessor :app_id

    # The account app_key
    attr_accessor :app_key

    def initialize(app_id, app_key)
      @app_id = app_id
      @app_key = app_key
    end
  end
end
