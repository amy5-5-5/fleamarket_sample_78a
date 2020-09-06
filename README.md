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
|post_code|integer|null: false|
|email|string|null: false, unique: true|
|password|text|null: false|
|encripted_password|text|null: false|

### Association
* has_many items
* has_many comments
* has_many likes


## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|text|null: false|
|size|string||
|shipping_date|string|null: false|
|brand_id|references|foreign_key: true|
|user_id|references|foreign_key: true, null: false|

### Association
* belongs_to user
* belongs_to brand
* has_many images
* has_many item_categories
* has_many categories, through: item_categories
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

### Association
* has_many sub_categries
* has_many item_categories
* has_many items, through: item_categories

## Sub_Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|categoriy_id|references|foreign_key: true|

### Association
* belongs_to category


## Item_Categoriesテーブル（中間テーブル）
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association
* belongs_to item
* belongs_to category

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










