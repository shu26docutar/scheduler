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
新規登録もしくは、ログインを行う
ルームの作成を行い
メモの追加をする
カレンダーにスケジュールを追加する

# 目指した課題解決
出勤や外出で手帳やメモを持ち歩くと荷物が多くなってしまったり忘れることもあり、まとめることができなくなってしまいます。
pcを用いて仕事をする方に、一つの画面で時間のロス・正しいスケジュールの管理・精神的負担を取り除くとこができるようにすることです。


# 洗い出した要件
## 機能
- ユーザー機能
- ルーム機能
- メモ機能
- スケジュール機能

## 目的
スケジュールを管理する中で、「メモを記録する・カレンダーを見る・スケジュールを立てる」この作業をすると沢山の物を使用します。
PCを外に持ち歩いたり、元から荷物が多い方、デスクワークするとなると更に荷物が嵩張ってしまう悩みを一つの画面で完結できるようにしました。

# 実装した機能についてのGIFと説明

# 実装予定の機能
- 新規登録・ログイン機能にSNS認証の導入
　SNSを使用している方が多くいらっしゃいますのでSNSを用いて、
　新規登録・ログインを行うことができるように設定をします。

- ルームの生成・スケジュールの生成をajaxを使用し画面遷移ないものにする
　一つの画面でアプリの機能を複数使用するために、ajaxを使用し機能を使用する上でストレスの内容にしたいと思います。

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
- has_many: room_users
- has_many: rooms,through: :room_users
- has_many: memos
- has_many: events


### Room
|     Column      |    Type   |            Options           |
| --------------- | --------- | ---------------------------- |
| name            | string    | null: false                  |

### Associateion
- has_many: room_users
- has_many: users,through: :room_users
- has_many: events


### Room_User
| Column |   Type    |            Options            |
| ------ | --------- | ----------------------------- |
| room   | reference | null: false,foreign_key: true |
| user   | reference | null: false,foreign_key: true |

### Associateion
- belongs_to: room
- belongs_to: user


### Memo
|     Column      |    Type   |            Options            |
| --------------- | --------- | ----------------------------- |
| content         | string    | null: false                   |
| room            | reference | null: false,foreign_key: true |
| user            | reference | null: false,foreign_key: true |

### Associateion
- belongs_to: room
- belongs_to: user


### Event
|     Column      |   Type    |      Options      |
| --------------- | --------- | ----------------- |
| title           | string    | null: false       |
| plan            | string    |                   |
| comment         | string    |                   |
| place           | string    |                   |
| url             | string    |                   |
| date_time       | datetime  | null: false       |

### Associateion
- belongs_to: user