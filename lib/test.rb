class Test
  attr_reader :sum_otv

  def self.from_file(path)
    file = File.new(path,"r:UTF-8")
    questions = file.readlines
    file.close
    new(questions)
  end

  def initialize(questions)
    @sum_otv = 0
    @num_step = 0
    @questions = questions
  end

  def answer_question(otv)
    if otv == 1
      @sum_otv += 2
    elsif otv == 3
      @sum_otv += 1
    end
    @num_step += 1
  end

  def question
    @questions[@num_step]
  end

  def in_progress?
    @num_step < @questions.size
  end
end
