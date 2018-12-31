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
    @result = result
  end

  def print_res(test)
    sum_otv = test.sum_otv
    puts "Результат теста #{sum_otv} баллов."
    puts
    if sum_otv >= 30
      puts @result[0]
    elsif sum_otv >= 25
      puts @result[1]
    elsif sum_otv >= 19
      puts @result[2]
    elsif sum_otv >= 14
      puts @result[3]
    elsif sum_otv >= 9
      puts @result[4]
    elsif sum_otv >= 4
      puts @result[5]
    else
      puts @result[6]
    end
  end
end
