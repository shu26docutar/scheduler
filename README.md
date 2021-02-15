# アプリケーション名
 MemoSuke

# アプリケーションの概要　
 メモ・スケジュールを一画面で管理することができるアプリケーションです。
 メモを記録する・削除する・メモを各部屋毎に分けること、スケジュールを登録する・削除する・編集することができます。
 画面にはカレンダーが掲載されており、手帳の役割を一画面で行うことができます。

# 利用方法
- 新規登録・ログイン
新規登録もしくは、ログインを行います。
- ルームの作成
新規登録・ログインが完了しましたら、ロゴの左下にある＋ボタンで新規ルームフォームに画面遷移いたします。
ルーム名を入力し、メモのルームを作成することができます。ルームを作成すると、左側にルームが表示されます。
- ルームの削除
ルーム名にカーソルを乗せると削除ボタンが現れます。削除ボタンを押すと、ルームとメモを共に削除することができます。
- メモの作成
作成したルームを押すことで、メモの追加が可能になります。中央のメモ入力欄にメモを入力し、保存ボタンを押すとメモが保存されます。複数ルームを作成した場合選択したルームでメモを保存することができます。そのことによりルームをメモの種類毎に分けることができます。
- カレンダーの使用方法
カレンダーの上記の＋ボタンを押すと、カレンダーにスケジュールを追加することができます。スケジュールを登録する時に任意で時間とスケジュールのタイトルを指定することができます。オプションでコメント・場所・urlを入力することができ、それぞれをスケジュールのメモとして活用いただけます。
カレンダーに表示されているスケジュール名をクリックするとスケジュールを確認することが可能になります。

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
[![Image from Gyazo](https://i.gyazo.com/72da9669697c65f747240dcd420caaf2.gif)](https://gyazo.com/72da9669697c65f747240dcd420caaf2)

# 実装予定の機能
- 新規登録・ログイン機能にSNS認証の導入
　SNSを使用している方が多くいらっしゃいますのでSNSを用いて、
　新規登録・ログインを行うことができるように設定をします。

- ルームの生成・スケジュールの生成をajaxを使用し画面遷移ないものにする
　一つの画面でアプリの機能を複数使用するために、ajaxを使用し機能を使用する上でストレスの内容にしたいと思います。

# ローカルでの動作方法
こちらで、アプリケーションのクローンを生成することができます。
## 開発環境の情報は以下になります。
- rails 6.0.0
- 2.7.2
- Server version 5.6.50

## コマンドは以下になります。
- git clone https://github.com/shu26docutar/scheduler
- bundle install
- rails db:create
- rails db:migrate
- rails s
- http://localhost:3000/

## 新規登録
- nickname: test1
- email: test1@test
- password: test01
- 名前（漢字）: 服部　楓平
- 名前（かな）: ハットリ　シュウヘイ

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