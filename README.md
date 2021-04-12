# テーブル設計

## users テーブル

| Column          | Type   | Options                    |
| --------------- | ------ | -------------------------- |
| email           | string | null: false, unique: true  |
| password        | string | null: false                |
| nick_name       | string | null: false, unique: true  |
| kanji_name      | string | null: false                |
| katakana_name   | string | null: false                |
| date_of_birth   | date   | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| name            | string       | null: false                    |
| price           | integer      | null: false                    |
| image           | ActiveStrage | null: false                    |
| description     | text         | null: false                    |
| category        | string       | null: false                    |
| condition       | string       | null: false                    |
| shipping_charge | string       | null: false,                   |
| shipping_source | string       | null: false,                   |
| shipping_date   | string       | null: false,                   |
| user            | references   | null: false, foreign_key: true |

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
| zip_code      | integer    | null: false                    |
| address       | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order