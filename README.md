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


# DB設計

## Usersテーブル（devise使用）
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
|zip_code|integer|null: false|
|email|string|null: false, unique: true|
|password|text|null: false|
|encripted_password|text|null: false|

### Association
* has_many items
* has_many comments
* has_many likes

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|



## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|condition|string|null: false|
|burden|string|null: false|
|area|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|brand_id|references|foreign_key: true|
|user_id|references|foreign_key: true, null: false|
|category_id|referemces|foreign_key: ture|
|seller_id|references|foreign_key: true|
|buyer_id|references|foreign_key: true|

### Association
* belongs_to user
* belongs_to brand
* belongs_to category
* has_many images
* has_many comments
* has_many likes


## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|foreign_key: true|

### Association
* belongs_to item


## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
* has_many items
* has_ancestry





## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
* has_many items

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
* belongs_to user
* belongs_to item

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
* belongs_to user
* belongs_to item










