# テーブル設計

## users テーブル

| Column             | Type   | Options   |
| ------------------ | ------ | --------- |
| name               | string | not null  |
| encrypted_password | string | not null  |
| email              | string | not null  |
| last_name          | string | not null  |
| first_name         | string | not null  |
| last_name_kana     | string | not null  |
| first_name_kana    | string | not null  |
| birthday           | date   | not null  |

### Association
- has_many :items
- has_many :buy_items

### items テーブル

| Column        | Type       | Options            |
| ------------- | ---------- | ------------------ |
| item_name     | string     | not null           |
| info          | text       | not null           |
| category_id   | integer    | not null           |
| status_id     | integer    | not null           |
| ship_value_id | integer    | not null           |
| ship_area_id  | integer    | not null           |
| ship_day_id   | integer    | not null           |
| price         | integer    | not null           |
| user          | references | foreign_key: true  |

### Association
- belongs_to :user
- has_one    :buy_item

### buy_items テーブル
| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

### Association
- belongs_to :item
- has_one    :shipping_info
- belongs_to :user

### shipping_info テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_num      | string     | not null          |
| prefecture_id | integer    | not null          |
| city          | string     | not null          |
| address       | string     | not null          |
| building      | string     |                   |
| phone_num     | string     | not null          |
| buy_item      | references | foreign_key: true |

### Association
- belongs_to :buy_item