module SerializeSymbol
  # refine....dont redefine
  # http://timelessrepo.com/refinements-in-ruby
  #----
  # Symbol#dump & Symbol#load are defined in order to be able to
  # serialze a string into a symbol
  # and essentially, save a Symbol into the database
  
  refine Symbol do
    def self.dump(symbol)
      symbol.to_s
    end

    def self.load(string)
      string.to_sym
    end

  end
  
end