class Result
  def self.from_file(path)
    file = File.new(path,"r:UTF-8")
    result = file.readlines
    file.close
    new(result)
  end

  def initialize(result)
    @result = result
  end

  def print_res(sum_otv)
    res =
      case sum_otv
      when (1..3) then 6
      when (4..8) then 5
      when (9..13) then 4
      when (14..18) then 3
      when (19..24) then 2
      when (25..29) then 1
      else
        0
      end
    @result[res]
  end
end
