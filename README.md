# データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|text|test||
|car_number|string||
|area_number|string||
|timestamps|timestamp|null: false|
|user_id|integer|null: false foreign_key: true|
|area_id|integer|null: false foreign_key: true|
|car_id|integer|null: false foreign_key: true|
### Association
- has_many :users
- has_many :comments
- has_many :number_tag
- has_many :cars, through: :number_tags
- belongs_to :area

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|timestamps|timestamp|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|circuit_id|integer|null: false, foreign_key: true|
### Association
- has_many :posts
- belongs_to :circuit

## circuitsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :areas

## carsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :posts, through: :number_tags
- belongs_to :number_tag

## number_tagテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :car


# 仕様  
1. userを登録　name, email, passwordが必須。  サインアップ、ログイン、ログアウトができる。（ユーザー削除も・・・）
1. 画像、メッセージを投稿する。画像は必須、メッセージは任意。（以下POSTと呼称）
1. POSTに対し複数のコメントを付与することができる。（以下commentと呼称）
1. POST一つに対して複数のcommentを表示させる詳細ページを表示する。
1. POSTはサーキットどこで撮ったものか？どの車のものかの？の入力を行い、タグ付けを行う。
1. サーキットの全体図を出しエリア分けして最新のPOSTの画像を表示する。
   サーキットでのPOSTの画像はajaxにて自動更新を行う。
1. サーキットの全体図に表示された画像をクリックするとその写真の場所に対してその写真を最新のものから一覧表示する。
   1ページ5つのPOSTを限度とし、ページネーションを行う。
1. 一台の同一車種に対してその写真を最新のものから一覧表示する。
   1ページ5つのPOSTを限度とし、ページネーションを行う。
1. 一人のPOSTの一覧を最新のものから一覧表示する。
   1ページ5つのPOSTを限度とし、ページネーションを行う。
1. 仕様7、8の表示を行う検索機能を実装する。
1. 未ログイン状態でも閲覧は可能　（編集、削除のコマンドを表示しない。ページが表示されない。）
1. ログイン状態であれば、自分のPOSTを編集削除することができる。
   削除の場合関連するcommentも全て削除する。
1. ログイン状態であれば、commentを編集削除することができる。