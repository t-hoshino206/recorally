# アプリケーション名
tabealook（タベアルック）

# アプリケーション概要
おすすめの外食ごはん・スイーツなどを気軽にシェアし、ユーザー同士でコミュニケーションをとることができる。<br>
スタンプラリー形式にすることで、ゲーム感覚で楽しむことができる。

# URL
https://recorally.herokuapp.com/

# テスト用アカウント
<ul>
  <li>Basic認証ID：recorally</li>
  <li>Basic認証パスワード：37588</li>
  <li>メールアドレス：test01@test.co.jp</li>
  <li>パスワード：test01</li>
</ul>

# 利用方法

## スタンプカードを作成する
1. トップページからユーザー新規登録を行う
2. カード作成ボタンから、共有したい情報を入力し作成する。
3. 必要に応じておすすめメニューを「メニュー追加」ボタンから追加する

## スタンプラリーを楽しむ
1. ホーム画面のスタンプカード一覧から、プレイしたいカードを選択する
2. 各おすすめメニューの「詳細」ボタンから、詳細ページに進む
3. お店を訪れおすすめメニューを食べたら「スタンプを押す」ボタンを押す

# アプリケーションを作成した背景
友人・知人との会話で、おすすめのご飯屋さんについての話題になった時に<br>
気軽に情報を共有できて、後で見てもわかりやすいアプリがあればいいと感じた。<br>
ただ情報を入れておくだけでなく、スタンプラリー要素を取り入れることで食べ歩き

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1xp8unMI8xZ1gxdxHfx-YYX8BdA-iDF0M30uJ8dubrlw/edit#gid=1650945082)

# 実装予定の機能
<ul>
  <li>検索機能</li>
  <li>フォロー＆フォロワー機能</li>
  <li>いいね機能</li>
  <li>カードのカテゴリプルダウンをハッシュタグ入力方式に変更</li>
  <li>プライベートモード（非公開設定を追加、共有せず自分用に使いたい人へ）</li>
  <li>アバター画像、ヘッダー画像の削除機能</li>
</ul>

# データベース設計
![データベース設計](db-image.png)

## usersテーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| avatar             | string     |                           |
| header             | string     |                           |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |


### Association

- has_many :cards
- has_many :playlogs


## cardsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :places


## placesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | string     | null: false                    |
| menu          | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| address       | string     | null: false                    |
| map           | string     |                                |
| card          | references | null: false, foreign_key: true |


### Association

- belongs_to :card
- has_many :playlogs


## playlogsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| place         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :place
- belongs_to :user

# 画面遷移図

# 開発環境
<ul>
<li>フロントエンド</li>
<li>バックエンド</li>
<li>インフラ</li>
<li>テスト</li>
<li>テキストエディタ</li>
<li>タスク管理</li>
</ul>

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/t-hoshino206/recorally.git
% cd t-hoshino206/recorally
% bundle install
% yarn install