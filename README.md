# README
# アプリケーション名
 MemoSuke

# アプリケーションの概要　
 メモ・スケジュールを一画面で管理することができるアプリケーションです。
 メモを記録する・削除する・メモを各部屋毎に分けること、スケジュールを登録する・削除する・編集することができます。
 画面にはカレンダーが掲載されており、手帳の役割を一画面で行うことができます。

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決

# 洗い出した要件
## 機能
・ユーザー機能
・ルーム機能
・メモ機能
・スケジュール機能

# 実装した機能についてのGIFと説明

# 実装予定の機能

# ローカルでの動作方法



## Assosiation

### User
|        Column        |   Type  |         Options                      |
| -------------------- | ------- | ------------------------------------ |
| nickname             | string  | null: false                          |
| email                | string  | null: false                          |
| encrypted_password   | string  | null: false,default: ""              |
| first_name           | string  | null: false                          |
| last_name            | string  | null: false                          |
| first_name_kana      | string  | null: false                          |
| last_name_kana       | string  | null: false                          |
| birthday             | date    |                                      |

### Associateion
has_many: room_users
has_many: rooms,through: :room_users
has_many: memos
has_many: events


### Room
|     Column      |    Type   |            Options           |
| --------------- | --------- | ---------------------------- |
| name            | string    | null: false                  |

### Associateion
has_many: room_users
has_many: users,through: :room_users
has_many: events


### Room_User
| Column |   Type    |            Options            |
| ------ | --------- | ----------------------------- |
| room   | reference | null: false,foreign_key: true |
| user   | reference | null: false,foreign_key: true |

### Associateion
belongs_to: room
belongs_to: user


### Memo
|     Column      |    Type   |            Options            |
| --------------- | --------- | ----------------------------- |
| content         | string    | null: false                   |
| room            | reference | null: false,foreign_key: true |
| user            | reference | null: false,foreign_key: true |

### Associateion
belongs_to: room
belongs_to: user


### Event
|     Column      |   Type    |      Options      |
| --------------- | --------- | ----------------- |
| title           | string    | null: false       |
| plan            | string    |                   |
| date_time       | datetime  | null: false       |

### Associateion
belongs_to: user