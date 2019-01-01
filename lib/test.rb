class Test
  attr_reader :sum_otv

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
    @QUESTIONS = questions
  end

  def get_user_input(num_step)
    question = @QUESTIONS[num_step]
    otv = 0
    until (1..3).include?(otv)
      puts question
      puts "Введите свой вариант ответа: 1 - да, 2 - нет, 3 - иногда"
      puts
      otv = gets.to_i
      puts
    end
    return otv
  end

  def step
    otv = get_user_input(@num_step)
    if otv == 1
      @sum_otv += 2
    elsif otv == 3
      @sum_otv += 1
    end
    @num_step += 1
  end

  def end?
    @num_step < @QUESTIONS.size
  end
end
