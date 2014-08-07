module RegexpM17N
  NOT_EMPTY = /^.+$/

  def self.non_empty?(str)
    begin
      str =~ NOT_EMPTY
    rescue Encoding::CompatibilityError, ArgumentError
      begin
        str.force_encoding(Encoding::UTF_8) =~ NOT_EMPTY
      rescue ArgumentError
        str.length > 0
      end
    end
  end
end