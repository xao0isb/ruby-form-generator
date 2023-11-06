![GitHub Actions](https://github.com/xao0isb/ruby-form-generator/actions/workflows/main.yml/badge.svg)

# Генератор форм

## Контрибьютинг

Установка:
```bash
make install
```

Тестирование:
```bash
make test
```

Линтинг:
```bash
make lint
```

## Принцип работы:

```ruby
user = User.new name: 'Jarad', age: 21, job: 'Grade A', gender: :m

FormGenerator.form_for user
# будет возвращать строку:
# '<form action="#" method="post"></form>'

# пример с передачей аттрибутов:
FormGenerator.form_for user, url: '/url', method: 'METHOD'
# будет возвращать строку:
# '<form action="/url" method="METHOD"></form>'

# пример с передачей блока:
FormGenerator.form_for user do |form|
    form.input :name, class: 'test-class'
    form.input :age
    form.input :job, type: 'test', id: 'job-input'
    form.input :job, as: :text, id: 'job-textarea'
    f.submit 'Submit text'
end
# будет возвращать строку:
=begin
'<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" value="Jarad" id="name" class="test-class" type="text">

  <label for="age">Age</label>
  <input name="age" value="21" id="age" type="number">

  <label for="job-input">Job</label>
  <input name="job" value="Grade A" id="job-input" type="test">

  <label for="job-textarea">Job</label>
  <textarea name="job" id="job-textarea" cols="20" rows="40">Grade A</textarea>

  <input type="submit" value="Submit text">
</form>'
=end

# при попытке сгенерировать input для несуществующего
# поля возникает ошибка NoMethodError
FormGenerator.form_for user do |form|
    form.input :surname # NoMethodError
end
```

### [Код программы](https://github.com/xao0isb/ruby-form-generator/tree/main/lib)

### [Тесты](https://github.com/xao0isb/ruby-form-generator/tree/main/test/test_form_generator.rb)

### [Фикстуры](https://github.com/xao0isb/ruby-form-generator/tree/main/test/fixtures)

При разработке использовались:
- Make;
- Minitest power assert - более удобное представлние метода assert при тестировании;
- Rubocop - линтинг.

## Тестирование

Используется `minitest`.

## CI/CD

Используется GitHub Actions - [workflow](https://github.com/xao0isb/ruby-form-generator/tree/main/.github/workflows/main.yml).
