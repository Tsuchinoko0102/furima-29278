# テーブル設計

## usersテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| mail     | string | null: false |
| password | string | null: false |

### Association
- has_one  :profile
- has_many :items
- has_many :purchases

## profilesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| family_name         | string     | null: false                    |
| first_name          | string     | null: false                    |
| family_name_reading | string     | null: false                    |
| first_name_reading  | string     | null: false                    |
| birth_year          | integer    | null: false                    |
| birth_month         | integer    | null: false                    |
| birth_day           | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## itemsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| duration_id   | integer    | null: false                    |

### Association
- has_one :purchase
- belongs_to :user
- belongs_to_active_hash :categories
- belongs_to_active_hash :status
- belongs_to_active_hash :fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :duration

## purchasesテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item

## addressesテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| postal   | integer    | null: false
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     |                                |
| phone_number  | integer    | null: false                    |
| purchase_id   | references | null: false, foreing_key: true |

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture