# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## DB設計

### Usersテーブル（devise使用）

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|family_name_furigana|string|null: false|
|first_name|string|null: false|
|first_name_furigana|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|text|null: false|
|post_code|integer|null: false|
|email|string|unique: true|
|password|text|null: false|
|encripted_password|text|null: false|

### Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|text|null: false|
|shipping_date|string|null: false|
|category_id|references|foreign_key: true, null: false|
|brand_id|references|foreign_key: true|
|user_id|references|foreign_key: true, null: false|
|comment_id|references|foreign_key: true|
|image_id|references|foreign_key: true|

### Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|foreign_key: true|

### Credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|exp_date|date|null: false|
|security_number|integer|null: false|
|name|string|null: false|
|user_id|integer|null: false|

### Categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Items_Categorysテーブル（中間テーブル）

|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|foreign_key: true|









