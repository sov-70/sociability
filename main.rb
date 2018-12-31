require "./lib/test.rb"
require "./lib/result.rb"

puts "Тест поможет определить ваш уровень коммуникабельности."
puts
puts "Для этого необходимо правдиво ответить на следующие вопросы."
puts

pach = __dir__ + "/data/questions.txt"
test = Test.from_file(pach)

pach = __dir__ + "/data/result.txt"
result = Result.from_file(pach)

while test.end?
  test.step
end

result.print_res(test)
