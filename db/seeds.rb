# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: 'Alastar', last_name: 'Corr', email: 'house.labs@gmail.com', password: 'qwerty', password_confirmation: 'qwerty', type: 'Admin')

Category.create(title: 'HTML & CSS')
Category.create(title: 'Javascript')
Category.create(title: 'Ruby')
Category.create(title: 'Ruby on Rails')

Test.create(title: 'HTML & CSS Basic', level: 1, category_id: 1, user_id: 1)
Test.create(title: 'HTML & CSS Pro', level: 2, category_id: 1, user_id: 1)
Test.create(title: 'Javascript Basic', level: 2, category_id: 2, user_id: 1)
Test.create(title: 'Javascript Pro', level: 3, category_id: 2, user_id: 1)
Test.create(title: 'Ruby', level: 2, category_id: 3, user_id: 1)
Test.create(title: 'Ruby On Rails', level: 4, category_id: 4, user_id: 1)

Question.create(body: 'С помощью каких свойств CSS можно задать цвета фона в блоке?', test_id: 1)
Question.create(body: 'Какой тег отвечает за инициализацию таблицы?', test_id: 1)
Question.create(body: 'Какой тег используется для отображения нумерованного списка?', test_id: 1)

Question.create(body: 'Для чего используется тег <canvas>', test_id: 2)
Question.create(body: 'Что означает атрибут «poster» для тега <video>', test_id: 2)
Question.create(body: 'Как создаются переменные в SASS', test_id: 2)

Question.create(body: 'Как узнать длину строки a?', test_id: 3)
Question.create(body: 'Как при помощи jQuery получить элемент с ID my-element?', test_id: 3)
Question.create(body: 'Javascript это диалект Java для клиента?', test_id: 3)

Question.create(body: 'Выберите допустимые способы записи числа в JavaScript:', test_id: 4)
Question.create(body: 'Что содержит объект даты, созданный с помощью инструкции “new Date()”?', test_id: 4)
Question.create(body: 'Какими способами можно создать новый пустой объект?', test_id: 4)

Question.create(body: 'Что возвращает следующее выражение? <code>[1, 2, 3, 4, 5].reject { |x| x.even? }.map { |x| x * x }</code>', test_id: 5)
Question.create(body: 'Что будет возвращено следующим выражением? <code>[1, 2, 3] | [2, 3, 4]</code>', test_id: 5)
Question.create(body: 'Что возвращает следующее выражение? <code>[1, 2, 3, 4, 5].select(&:odd?)</code>', test_id: 5)

Question.create(body: 'В какой директории ROR приложения лежит основной код?', test_id: 6)
Question.create(body: 'Как создать новое ROR приложение?', test_id: 6)
Question.create(body: "Что вернет выражение? <code>['abc', 'def', 'gnt'].sort!</code>", test_id: 6)

Answer.create(title: 'bk-color', correct: false, question_id: 1)
Answer.create(title: 'background-color', correct: true, question_id: 1)
Answer.create(title: 'color', correct: false, question_id: 1)
Answer.create(title: 'background', correct: true, question_id: 1)

Answer.create(title: '<div>', correct: false, question_id: 2)
Answer.create(title: '<p>', correct: false, question_id: 2)
Answer.create(title: '<span>', correct: false, question_id: 2)
Answer.create(title: '<table>', correct: true, question_id: 2)

Answer.create(title: '<ul>', correct: false, question_id: 3)
Answer.create(title: '<list>', correct: false, question_id: 3)
Answer.create(title: '<nlist>', correct: false, question_id: 3)
Answer.create(title: '<ol>', correct: true, question_id: 3)

Answer.create(title: 'Создает список вариантов, которые можно выбирать при наборе в текстовом поле', correct: false, question_id: 4)
Answer.create(title: 'Создает область, в которой при помощи JavaScript можно рисовать разные объекты, выводить изображения', correct: true, question_id: 4)
Answer.create(title: 'Используется для редактирования шрифта текста', correct: false, question_id: 4)

Answer.create(title: 'При завершении композиции она запустится вновь', correct: false, question_id: 5)
Answer.create(title: 'Отсутствие автоматической загрузки видеофайла', correct: false, question_id: 5)
Answer.create(title: 'Выставляет изображение которое браузер будет использовать пока загружается', correct: true, question_id: 5)
Answer.create(title: 'Добавление аудиодорожки', correct: false, question_id: 5)

Answer.create(title: '&name', correct: false, question_id: 6)
Answer.create(title: '@name', correct: false, question_id: 6)
Answer.create(title: '$name', correct: true, question_id: 6)
Answer.create(title: '#name', correct: false, question_id: 6)

Answer.create(title: 'count(length)', correct: false, question_id: 7)
Answer.create(title: 'a.length', correct: true, question_id: 7)
Answer.create(title: 'Нет правильных вариантов', correct: false, question_id: 7)
Answer.create(title: 'strlen(a)', correct: false, question_id: 7)

Answer.create(title: '$("my-element")', correct: false, question_id: 8)
Answer.create(title: '$(".my-element")', correct: false, question_id: 8)
Answer.create(title: '$("#my-element")', correct: true, question_id: 8)
Answer.create(title: 'document.get("#my-element")', correct: false, question_id: 8)

Answer.create(title: 'Да', correct: false, question_id: 9)
Answer.create(title: 'Нет', correct: true, question_id: 9)

Answer.create(title: '015', correct: true, question_id: 10)
Answer.create(title: '5e-2', correct: true, question_id: 10)
Answer.create(title: '0x55', correct: true, question_id: 10)
Answer.create(title: '0b1001', correct: true, question_id: 10)

Answer.create(title: 'Текущую дату и время на начало дня', correct: false, question_id: 11)
Answer.create(title: 'Пустую дату', correct: false, question_id: 11)
Answer.create(title: 'Текущую дату и текущее время', correct: true, question_id: 11)

Answer.create(title: 'var obj = {}', correct: true, question_id: 12)
Answer.create(title: 'var obj = new {}', correct: false, question_id: 12)
Answer.create(title: 'var obj = new Object()', correct: true, question_id: 12)
Answer.create(title: 'var obj = []', correct: false, question_id: 12)

Answer.create(title: "NoMethodError: undefined method 'map'", correct: false, question_id: 13)
Answer.create(title: '[4, 16]', correct: false, question_id: 13)
Answer.create(title: '[1, 9, 25]', correct: true, question_id: 13)

Answer.create(title: '[1, 2, 3, 4]', correct: true, question_id: 14)
Answer.create(title: '[1, 4]', correct: false, question_id: 14)
Answer.create(title: '[2, 3, 4]', correct: false, question_id: 14)
Answer.create(title: '[1, 2, 3, 2, 3, 4]', correct: false, question_id: 14)
Answer.create(title: '[1, 2, 3, [2, 3, 4]]', correct: false, question_id: 14)

Answer.create(title: '[2, 4]', correct: false, question_id: 15)
Answer.create(title: '[1, 2, 3, 4, 5]', correct: false, question_id: 15)
Answer.create(title: '[1, 3, 5]', correct: true, question_id: 15)
Answer.create(title: "NoMethodError: undefined method 'select'", correct: false, question_id: 15)
Answer.create(title: 'nil', correct: false, question_id: 15)

Answer.create(title: 'bin/', correct: false, question_id: 16)
Answer.create(title: 'doc/', correct: false, question_id: 16)
Answer.create(title: 'app/', correct: true, question_id: 16)
Answer.create(title: 'log/', correct: false, question_id: 16)

Answer.create(title: 'ruby on rails new app first_app', correct: false, question_id: 17)
Answer.create(title: 'ROR magic', correct: false, question_id: 17)
Answer.create(title: 'Create application with ROR', correct: false, question_id: 17)
Answer.create(title: 'rails new first_app', correct: true, question_id: 17)

Answer.create(title: "['abc', 'def', 'gnt']", correct: true, question_id: 18)
Answer.create(title: "{'abc', 'def', 'gnt'}", correct: false, question_id: 18)
Answer.create(title: 'undefined', correct: false, question_id: 18)
Answer.create(title: 'error', correct: false, question_id: 18)
Answer.create(title: 'nil', correct: false, question_id: 18)
