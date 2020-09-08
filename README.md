# テーブル設計

## usersテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| mail                | string     | null: false                    |
| password            | string     | null: false                    |
| family_name         | string     | null: false                    |
| first_name          | string     | null: false                    |
| family_name_reading | string     | null: false                    |
| first_name_reading  | string     | null: false                    |
| birthday            | date       | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| text          | string     | null: false                    |
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
- belongs_to_active_hash :category
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
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal        | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture