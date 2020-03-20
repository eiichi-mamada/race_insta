# README
このサイトは、個人的に初めて作成したWebアプリケーションです。
このアプリケーションの目的はサーキット内でアマチュア写真家の方々の写真を投稿し合い、交流することを目的としています。
私はとくに国内自動車レース「SUPER GT」「SUPER FORMULA」が大好きです。
今後、私もサーキットで写真を撮っていきたいと考えています。

開発期間： 2週間（但し、都度の修正を加えております。）
開発人数： 1名

# Future
更なるユーザビリティの向上を目指し、追加実装をしていく予定です。
* 現在ツインリンクもてぎロードコースのみとなっています。随時他のサーキットの追加機能。
* コメント、タグの編集、削除機能
* ユーザーフォロー、カーフォロー昨日の追加
* 機械学習による画像からcar_numberのデータを検出。

# 仕様  
1. userを登録 name, email, passwordが必須。  サインアップ、ログイン、ログアウトができる。（※ユーザー削除も今後搭載。）
1. 画像、メッセージを投稿する。画像は必須、メッセージは任意。（以下POSTと呼称）
1. POSTに対し複数のコメントを付与することができる。（以下commentと呼称）
1. POST一つに対して複数のcommentを表示させる詳細ページを表示する。
1. POSTはサーキットどこで撮ったものか？どの車のものかの？の入力を行い、タグ付けを行う。
1. サーキットの全体図を出しエリア分けして最新のPOSTの画像を表示する。
1. サーキットの全体図に表示された画像をクリックするとその写真の場所に対してその写真を最新のものから一覧表示する。
   ※現在検索欄において１〜８のエリア情報を入力することでその情報が付与されている画像一覧を表示させる。
   1ページ5つのPOSTを限度とし、ページネーションを行う。
1. 一台の同一車種に対してその写真を最新のものから一覧表示する。
   検索欄で「＃１００」のようにすることでカーナンバー１００の情報がある画像を表示する。
   1ページ5つのPOSTを限度とし、ページネーションを行う。
   ※なお、登録してある車種とカーナンバーは2020年シーズンの「SUPER GT GT500」の車種です。

1. 一人のPOSTの一覧を最新のものから一覧表示する。
   1ページ5つのPOSTを限度とし、ページネーションを行う。
1. 仕様7、8の表示を行う検索機能を実装する。
1. 未ログイン状態でも閲覧は可能　（編集、削除のコマンドを表示しない。ページが表示されない。）
1. ログイン状態であれば、自分のPOSTを編集削除することができる。
   削除の場合関連するcommentも全て削除する。
1. ログイン状態であれば、commentを編集削除することができる。

# Requirement
開発環境
* ruby 2.5.1
* rails 5.2.3

デプロイ環境
* AWS（EC2）

# notice
当サイトは随時ブラッシュアップを行っております。
なお、すでに投稿されている画像はフリーの画像であり、実際の光景とは異なります。
タイミングによっては、正常に表示されない場合がございます。その際は、少し時間をおいてアクセスして下さい。
また、当サイトにはベーシック認証や各種アカウント設定が行われています。


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





# Author
ママダ　エイイチ
2020年３月、10週間に及ぶプログラミングスクールでの学習を終了し、転職活動中

email： t68.mamada.eiichi@gmail.com