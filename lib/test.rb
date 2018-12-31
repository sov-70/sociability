class Test
  def self.from_file(pach)
    if File.exist?(pach)
      file = File.new(pach,"r:UTF-8")
      questions = file.readlines
      file.close
      new (questions)
    else
      abort "Файл вопросов не найден - #{pach} "
    end
  end

  def initialize(questions)
    @sum_otv = 0
    @num_step = 0
    @questions = questions
  end

  def step
    item = @questions[@num_step]
    @num_step += 1
    otv = 0
    until (1..3).include?(otv)
      puts item
      puts "Введите свой вариант ответа: 1 - да, 2 - нет, 3 - иногда"
      puts
      otv = gets.to_i
      puts
    end
    if otv == 1
      @sum_otv += 2
    elsif otv == 3
      @sum_otv += 1
    end
  end

  def end?
    @num_step < @questions.size
  end

  def sum_otv
    @sum_otv
  end
end
