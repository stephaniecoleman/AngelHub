module SerializeSymbol

  refine Symbol do
    def self.dump(symbol)
      symbol.to_s
    end

    def self.load(string)
      string.to_sym
    end
  end
  
end