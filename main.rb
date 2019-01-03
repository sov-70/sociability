require_relative "lib/test"
require_relative "lib/result"

questions_path = __dir__ + "/data/questions.txt"
begin
  test = Test.from_file(questions_path)
rescue Errno::ENOENT
  abort "Не найден файл вопросов - #{questions_path}."
end

results_path = __dir__ + "/data/result.txt"
begin
  result = Result.from_file(results_path)
rescue Errno::ENOENT
  abort "Не найден файл ответов - #{results_path}"
end

puts "Тест поможет определить ваш уровень коммуникабельности."
puts
puts "Для этого необходимо правдиво ответить на следующие вопросы."
puts

while test.in_progress?
  otv = 0
  until (1..3).include?(otv)
    puts test.question
    puts "Введите свой вариант ответа: 1 - да, 2 - нет, 3 - иногда"
    puts
    otv = gets.to_i
    puts
  end
  test.answer_question(otv)
end

puts "Результат теста #{test.sum_otv} баллов."
puts
puts result.print_res(test.sum_otv)
