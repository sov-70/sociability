class Result
  def self.from_file(pach)
    if File.exist?(pach)
      file = File.new(pach,"r:UTF-8")
      result = file.readlines
      file.close
      new (result)
    else
      abort "Не найден файл ответов - #{pach}"
    end
  end

  def initialize(result)
    @RESULT = result
  end

  def print_res(test)
    sum_otv = test.sum_otv
    puts "Результат теста #{sum_otv} баллов."
    puts
    res = case sum_otv
          when (1..3) then 6
          when (4..8) then 5
          when (9..13) then 4
          when (14..18) then 3
          when (19..24) then 2
          when (25..29) then 1
          else 0
          end
    puts @RESULT[res]
  end
end
