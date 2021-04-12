# テーブル設計

## users テーブル

| Column                | Type   | Options                    |
| --------------------- | ------ | -------------------------- |
| email                 | string | null: false, unique: true  |
| encrypted_password    | string | null: false                |
| nick_name             | string | null: false, unique: true  |
| kanji_family_name     | string | null: false                |
| kanji_given_name      | string | null: false                |
| katakana_family_name  | string | null: false                |
| katakana_given_name   | string | null: false                |
| date_of_birth         | date   | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| name                | string       | null: false                    |
| price               | integer      | null: false                    |
| description         | text         | null: false                    |
| category_id         | integer      | null: false                    |
| condition_id        | integer      | null: false                    |
| shipping_charge_id  | integer      | null: false,                   |
| shipping_source_id  | integer      | null: false,                   |
| shipping_date_id    | integer      | null: false,                   |
| user                | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order