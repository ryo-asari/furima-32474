## users table

|Column    |Type  |Options    |
|----------|------|-----------|
|nickname  |string|null: false|
|email     |string|null: false, unique: true|
|password  |string|null: false|
|first_name|string|null: false|
|last_name |string|null: false|
|first_kana|string|null: false|
|last_kana |string|null: false|
|birthday  |date  |null: false|


### Association

* has_many :items
* has_many :buy

## items table

|Column     |Type      |Options    |
|-----------|----------|-----------|
|image      |          |null: false|
|title      |text      |null: false|
|explanation|text      |null: false|
|category   |date      |null: false|
|condition  |date      |null: false|
|shipping   |date      |null: false|
|area       |date      |null: false|
|days       |date      |null: false|
|price      |text      |null: false|
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
|credit      |string|null: false|
|postal      |string|null: false|
|prefecture  |string|null: false|
|city        |string|null: false|
|house_number|string|null: false|
|phone_number|string|null: false|
|buy         |references|foreign_key: true|

### Association

- belongs_to :buy