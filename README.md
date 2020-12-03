# テーブル設計

## users テーブル

| Column          | Type   | Options   |
| --------------- | ------ | --------- |
| name            | string | not null  |
| password        | string | not null  |
| email           | string | not null  |
| last_name       | string | not null  |
| first_name      | string | not null  |
| last_name_kana  | string | not null  |
| first_name_kana | string | not null  |
| birthday        | string | not null  |

### Association
- has_many   :items
- has_many   :shipping_infos
- belongs_to :buy_item

### items テーブル

| Column     | Type       | Options            |
| ---------- | ---------- | ------------------ |
| item_name  | string     | not null           |
| info       | text       | not null           |
| category   | text       | not null           |
| status     | text       | not null           |
| shipping   | text       | not null           |
| ship_area  | string     | not null           |
| ship_day   | string     | not null           |
| price      | integer    | not null           |
| user_id    | references |  foreign_key: true |

### Association
- belongs_to :user
- has_many   :buy_items

### buy_items テーブル
| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| card_num   | integer    | not null          |
| card_month | integer    | not null          |
| card_year  | integer    | not null          |
| card_cvc   | integer    | not null          |
| user_id    | references | foreign_key: true |
| item_id    | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :shipping_info

### shipping_info テーブル
| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| post_num   | integer    | not null          |
| prefecture | string     | not null          |
| city       | string     | not null          |
| address    | text       | not null          |
| building   | text       |                   |
| phone_num  | integer    | not null          |
| user_id    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :buy_item