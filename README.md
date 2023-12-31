# RFA_record

## サービス概要
RFA_recordはリングフィットアドベンチャー（以下RFA）の
アドベンチャーモードの活動記録画面の写真を撮るだけで
「活動時間」「消費カロリー」「走行距離」のデータをグラフ化するサービスです。

## 想定されるユーザー層
- RFAを持っているが使用していない、継続できない方

## サービスコンセプト
みなさんの家に埃が被っているRFAはありませんか？
私も頑張るぞと意気込んで購入し、始めたものの長続きしませんでした...
そこで私はRFAが継続できない理由を考えてみました。

- 自分の頑張りを実感しにくい
  - 通常の活動記録では、自分の日々の努力が感じづらいことがあります。
- 活動記録を確認するのが面倒
  - 従来の方法では活動記録を確認する手間や時間がかかることがあります。
- 活動記録がわかりにくい形式で提供される
  - 活動データがテキストで提供されると、ユーザーは努力の成果を理解しにくくなります。
- 成果を他人と共有しにくい
  - Switchのフレンドの活動記録は確認できるが確認するのに手間がかかる。
  - Switchのフレンド以外（SNS等）への活動記録の共有も手間がかかる。

私たちはこれらの課題を解決し、ユーザーの健康的な習慣形成をサポートします。
あなたの活動データを、鮮やかなグラフで視覚化することで、日々の成果を一目で確認できるようにします。
さらに、他のユーザーと情報を共有し、競争心を刺激することで、モチベーションの向上を支援します。

主な特徴
RFA_recordは以下の特徴を備えています。

- 写真から簡単に活動データを抽出し、美しいグラフに変換
  - 写真を撮るだけで、データが自動的に抽出され、分かりやすいグラフで表現されます。
- 活動記録を共有し、仲間と共に喜びを共有
  - 活動の成果や進捗をサービス内の掲示板やSNSで共有し、仲間と一緒に励まし合いお互いに刺激を受けながら楽しむことができます。
- 週間・月間のトレンド分析
  - 週間や月間のトレンド分析を通じて、長期的な進歩を把握できます。
- リマインド機能による習慣定着のサポート
  - ユーザーが設定した時刻にLINE通知で活動時間をお知らせし、習慣の定着をサポートします。

## 主な機能
- 会員登録（LINE）
- ログイン
- プロフィール編集
- 写真送付
- 画像認識APIによるデータ抽出
- 文字化したデータのTwitter投稿機能
- 活動記録投稿
  - ユーザーが選択可能
- 活動記録のグラフを週間、月間で表示できる機能
- (リマインド機能)
  - ユーザーが設定した時刻に活動時間をLINE通知でお知らせしてくれる機能

## 画面遷移図
[figma](https://www.figma.com/file/un8cIHFMRvSCLWNKG3npIT/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=iHrcsFHyKmszz8YF-1)

## ER図
[ER図](https://drive.google.com/file/d/1wM5mSui0ylUu6iIfC968MGkoe8Krycow/view?usp=sharing)

## 技術選定
- Ruby 3.1.3
- Rails 7.0.7.2
- Node.js 20.8.0
- CSS Bootstrap
- Webアプリケーションサーバ Render
- データベース PostgreSQL
- ファイルサーバ AWS S3
- LINE Front-end Framework（LIFF）
- 画像認識 Cloud Visin API
