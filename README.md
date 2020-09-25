# アプリケーション名
Camp Item

# アプリケーション概要
ユーザーがアウトドア用品の画像を投稿し、それに対してお気に入りやコメントができます。

# URL

# テスト用アカウント

# 利用方法
ログインする事で自分のお気に入りのアウトドア用品の写真を投稿できます。

# 実装予定の機能
・お気に入り機能の実装
・コメント機能の実装

# ER図
https://gyazo.com/01c2b8b69659834e834aba49bfa1a997

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