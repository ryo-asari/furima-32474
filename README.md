## users table

|Column    |Type  |Options    |
|----------|------|-----------|
|nickname  |string|null: false|
|email     |string|null: false, unique: true|
|encrypted_password|string|null: false|
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
|title      |text      |null: false|
|explanation|text      |null: false|
|category_id|integer   |null: false|
|condition_id|integer  |null: false|
|shipping_id|integer   |null: false|
|prefecture_id|integer   |null: false|
|days_id    |integer   |null: false|
|price      |integer   |null: false|
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
|prefecture_id|integer|null: false|
|city        |string|null: false|
|block_number|string|null: false|
|building_number|string|null: false|
|phone_number|string|null: false|
|buy         |references|foreign_key: true|

### Association

- belongs_to :buy