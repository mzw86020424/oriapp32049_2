## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |

### 画像はActiveStorageを使用

### Association

- has_many :posts


## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| url     | text       | null: false                    |
| month   | string     | null: false                    |
| year    | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user