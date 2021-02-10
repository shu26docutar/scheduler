# README


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