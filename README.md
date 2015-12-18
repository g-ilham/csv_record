### CSV Record (Мой тестовый проект)

Гем позволяет производить манипуляции с табличными данными в формате CSV.

![Logo](https://raw.githubusercontent.com/g-ilham/csv_record/master/readme_images/csv.png)

#### Установка

Gemfile

```
gem 'csv_record', '0.0.1', git: 'git@github.com:g-ilham/csv_record.git'
```

```
bundle install
```

#### Использование

В выбранный класс, например app/models/customer.rb

```
class Customer
  attr_accessor :id,
                :first_name,
                :last_name

  def initialize(attrs)
    attrs.each do |k, v|
      self.public_send("#{k}=", v)
    end
  end
end

```

добавляем:

```
class Customer
  include CsvRecord::ActsAsCsvRecord

  acts_as_csv_record

  ...
end
```

#### Доступные операции

1) Создание

```
c = Customer.create(first_name: "Ilgam", last_name: "Gaysin")
 => #<Customer:0x000000054ce460 @first_name="Ilgam", @last_name="Gaysin", @id="1">
```

2) Поиск по ID

```
c = Customer.find(1)
 => #<Customer:0x000000054f6ed8 @first_name="Ilgam", @last_name="Gaysin", @id="1">
```

3) Обновление

```
c = Customer.find(1)
 => #<Customer:0x000000054a84b8 @first_name="Ilgam", @last_name="Gaysin", @id="1">

c.update(first_name: "Grisha")
 => #<Customer:0x000000054a84b8 @first_name="Grisha", @last_name="Gaysin", @id="1">

c = Customer.find(1)
 => #<Customer:0x000000054a84b8 @first_name="Grisha", @last_name="Gaysin", @id="1">
```

4) Удаление

```
c.destroy
 => true

c = Customer.find(1)
RuntimeError: Record with id 1 not exist
```

5) All

```
all = Customer.all
 => [#<Customer:0x000000053c6018 @first_name="Ilgam", @last_name="Gaysin", @id="1">, #<Customer:0x000000053c5eb0 @first_name="Grisha", @last_name="Ivanov", @id="2">, #<Customer:0x000000053c5d48 @first_name="Rashid", @last_name="Burganov", @id="3">]

all.last.last_name
 => "Burganov"

all.first.first_name
 => "Ilgam"

all.map(&:id)
 => ["1", "2", "3"]
```

6) First

```
c = Customer.first
 => #<Customer:0x00000005396868 @first_name="Ilgam", @last_name="Gaysin", @id="1">
```

7) Last

```
c = Customer.last
 => #<Customer:0x000000053829f8 @first_name="Rashid", @last_name="Burganov", @id="3">
```

#### Тесты

```
rake
```

This project rocks and uses MIT-LICENSE.
