# アプリケーション名
Camp Item

# アプリケーション概要
ユーザーがアウトドア用品の画像を投稿し、それに対してお気に入りやコメントができます。

# URL
http://18.177.196.208

# テスト用アカウント
テストID: test@aaa.com
テストPASS: aaaa1111
# 利用方法
ログインする事で自分のお気に入りのアウトドア用品の写真を投稿できます。

# 実装予定の機能
・カテゴリー検索機能
・JavaScriptを使ったページ表示機能

# ER図
https://gyazo.com/cd741decf9024d391e0f2fcd365208d7

# テーブル設計

## users テーブル

| Column           | Type   | Options     | 
|----------------- | ------ | ----------- |   
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |

## Association
has_many :posts
has_many :messages
has_many :like

## posts テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ | 
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

## Association
has_one :messages
bilongs_to :user
has_many :like

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

## Association
belongs_to :post
belongs_to :user

## like テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

## Association
belongs_to :user
belongs_to :post