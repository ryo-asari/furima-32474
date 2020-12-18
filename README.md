## users table

|Column  |Type  |Options    |
|--------|------|-----------|
|nickname|string|null: false|
|email   |string|null: false, unique: true|
|password|string|null: false|
|name    |string|null: false|
|birthday|string|null: false|


### Association

* has_many :items
* has_many :buy

## items table

|Column     |Type      |Options    |
|-----------|----------|-----------|
|image      |          |null: false|
|title      |text      |null: false|
|explanation|text      |null: false|
|category   |          |null: false|
|condition  |          |null: false|
|shipping   |          |null: false|
|area       |          |null: false|
|days       |          |null: false|
|price      |          |null: false|
|user       |references|foreign_key: true|

### Association

- belongs_to :user
- has_one    :buy

## buy table

|Column|Type      |Options          |
|------|----------|-----------------|
|user  |references|foreign_key: true|
|item  |references|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address

|Column      |Type  |Options    |
|------------|------|-----------|
|postal      |string|null: false|
|prefecture  |string|null: false|
|city        |string|null: false|
|house_number|string|null: false|
|phone_number|string|null: false|
|buy         |references|foreign_key: true|

### Association

- belongs_to :buy