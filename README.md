## このリポジトリについて

ビールのある日常について情報をまとめることができるWebメディア機能を提供するアプリケーション

## 開発環境について

開発環境の構築について以下まとめます。以下環境にて動作確認済です。


- Mac OS X Yosemite（10.10.5）
- Mac OS X El Capitan（10.11.4）
- Ruby 2.2.2
  - rbenvを利用してインストールしてます
  - ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin15]
  

### database.ymlの設定

git cloneしたらターミナル上で

```sh
cp config/database.yml.sample config/database.yml
```

としてからconfig/database.ymlをご自身の環境に応じて編集してください。

具体的には以下の箇所を適宜編集してください。

```yaml
  username: root
  password:
  socket: /tmp/mysql.sock
```

### migrataionとマスターデーターの投入

以下コマンドを実行することで

- データベースの作成
- migration実行
- マスターデーターの投入

を行います

```sh
./bin/rake db:create; ./bin/rake db:migrate; ./bin/rake db:seed_fu
```

なお、当面の間は、頻繁にテーブル構成を変更してく予定で、db/migrate配下のファイルを直接編集することがあるので、最新のdevelopの情報を取り込んだ後は


```sh
git checkout develop
git fetch origin
git merge origin master
./bin/rake db:migrate:reset; ./bin/rake db:seed_fu
```

という形でマイグレーションをリセットしてもらえればと思います

## Gitの運用フローについて

Gitの運用フローについて以下まとめていきます

### git-flowで運用していきます。

git-flowについてよくわからない場合には[このあたりがイメージつけやすいと思うので](http://qiita.com/KosukeSone/items/514dd24828b485c69a05)参考にしてください。

似た名前でもっとシンプルなGitHub Flowもあるのですが以下理由でgit-flowでの運用にしてます

- 頻繁にデプロイをするほどでもない
- masterは安定した状態の位置づけにしておきたい

### 実際の作業の流れ

Featureブランチ作る時には、issueのIDと紐付ける形にしてください。

例えばですが、[Let's Encrypt使ってHTTPS対応する](https://github.com/h5y1m141/life_with_beer/issues/59)というIssueを対応する場合には以下のようにgit-flowコマンドで対応してもらえればOKです

```sh
git-flow feature start ISSUE-59
```

```sh
 git-flow feature start ISSUE-59
Branches 'develop' and 'origin/develop' have diverged.
And local branch 'develop' is ahead of 'origin/develop'.
M       README.md
Switched to a new branch 'feature/ISSUE-59'

Summary of actions:
- A new branch 'feature/ISSUE-59' was created, based on 'develop'
- You are now on branch 'feature/ISSUE-59'

Now, start committing on your feature. When done, use:

     git flow feature finish ISSUE-59
```

### 作業の進捗をおおまかに把握したいのでWIPのプルリクエストを最初に作る

空き時間などに作業をしてもらうことを念頭に置いてるので、こまめな進捗報告は特にいらないのですが、少なくとも

1. 作業を開始したかどうか
2. 作業とりかかった後の進捗

というのを大まかに把握をしたいので、最初にWIPのプルリクエスト作ってもらってこまめに更新してもらう形にしてもらうとありがたいです。

参考までにWIPのプルリクエスト使った作業フローは[こういうやつ](http://qiita.com/numa08/items/b676e38e3dbabfd39d18)です

すでにFeatureブランチを作って、Let's Encrypt使ってHTTPS対応するというIssueの対応をする場合のgitの作業例を以下簡単にまとめておきます

#### 空のコミット作る

```sh
git commit --allow-empty -m "[WIP]Let's Encrypt使ってHTTPS対応"
```

#### pushする

現在のFeatureブランチをpushする

```sh
git push origin feature/ISSUE-59
```

#### pushした後に、プルリクエスト作ってGitHub上でこれからやる作業についてまとめる

pushした後に[GitHubのページ](https://github.com/h5y1m141/life_with_beer)にアクセスして、プルリクエストを作ってください。

Issue作る時に、お願いしたいことをなるべく明確にするようにしてますが、ちょっとしたモレとか、互いの認識のズレとかが生まれるかもしれので、そのIssue対応をする上でどんな順番で作業してく予定かおおまかに書いておいてもらえると嬉しいです！（後は何か作業上でわからないことが出た場合にフォローできるため）

以下記入例

![プルリクエスト作成](https://cloud.githubusercontent.com/assets/950924/14694580/9425ccfe-07a4-11e6-96f1-8ea224ccadd1.png)


