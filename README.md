# 日本の祝日判定Rubyプログラム

([GitHub](https://github.com/masa16/holiday_japan)),
([RubyGems](https://rubygems.org/gems/holiday_japan))

## 特徴
* 1948年7月20日以降の日本の国民の祝日、振替休日、および国民の休日を計算して判定する

(date2 の holiday.rb と比較して)
* 祝日をキャッシュすることにより、大量の日付について祝日判定する場合でも高速に動作
* 祝日名を返すことが可能
* 祝日のルールをテーブルで持つことにより、法改正による祝日変更への対応が容易

## インストール

* RubyGems によるインストール
  ```
  gem install holiday_japan
  ```

* または、[holiday_japan.rb](https://github.com/masa16/holiday_japan/blob/master/lib/holiday_japan.rb)
  のスクリプトファイルを ruby のライブラリパスに置く

## 使い方

### モジュールをロード

  ```ruby
  require 'holiday_japan'
  ```

### HolidayJapan モジュール関数

* `check(date)` ― Dateクラスのオブジェクトによる祝日判定

  ```ruby
  HolidayJapan.check(Date.new(2017,3,20))
  => true
  ```

* `name(date)` ― 日付が祝日の場合は祝日名を返し、祝日でなければ nil を返す。

  ```ruby
  HolidayJapan.name(Date.new(2017,3,20))
  => "春分の日"
  ```

* `print_year(year)` ― ある年の祝日一覧をプリント

  ```
  $ ruby -r holiday_japan -e 'HolidayJapan.print_year 2017'
  listing year 2017...
  2017-01-01 Sun 元日
  2017-01-02 Mon 振替休日
  2017-01-09 Mon 成人の日
  2017-02-11 Sat 建国記念の日
  2017-03-20 Mon 春分の日
  2017-04-29 Sat 昭和の日
  2017-05-03 Wed 憲法記念日
  2017-05-04 Thu みどりの日
  2017-05-05 Fri こどもの日
  2017-07-17 Mon 海の日
  2017-08-11 Fri 山の日
  2017-09-18 Mon 敬老の日
  2017-09-23 Sat 秋分の日
  2017-10-09 Mon 体育の日
  2017-11-03 Fri 文化の日
  2017-11-23 Thu 勤労感謝の日
  2017-12-23 Sat 天皇誕生日
  ```

* `list_year(year)` ― ある年について、 [日付, 祝日名] のArrayを返す

  ```ruby
  HolidayJapan.list_year(2017)
  => [[#<Date: 2017-01-01 ((2457755j,0s,0n),+0s,2299161j)>, "元日"],
      [#<Date: 2017-01-02 ((2457756j,0s,0n),+0s,2299161j)>, "振替休日"],
      [#<Date: 2017-01-09 ((2457763j,0s,0n),+0s,2299161j)>, "成人の日"],
      [#<Date: 2017-02-11 ((2457796j,0s,0n),+0s,2299161j)>, "建国記念の日"],
      [#<Date: 2017-03-20 ((2457833j,0s,0n),+0s,2299161j)>, "春分の日"],
      [#<Date: 2017-04-29 ((2457873j,0s,0n),+0s,2299161j)>, "昭和の日"],
      [#<Date: 2017-05-03 ((2457877j,0s,0n),+0s,2299161j)>, "憲法記念日"],
      [#<Date: 2017-05-04 ((2457878j,0s,0n),+0s,2299161j)>, "みどりの日"],
      [#<Date: 2017-05-05 ((2457879j,0s,0n),+0s,2299161j)>, "こどもの日"],
      [#<Date: 2017-07-17 ((2457952j,0s,0n),+0s,2299161j)>, "海の日"],
      [#<Date: 2017-08-11 ((2457977j,0s,0n),+0s,2299161j)>, "山の日"],
      [#<Date: 2017-09-18 ((2458015j,0s,0n),+0s,2299161j)>, "敬老の日"],
      [#<Date: 2017-09-23 ((2458020j,0s,0n),+0s,2299161j)>, "秋分の日"],
      [#<Date: 2017-10-09 ((2458036j,0s,0n),+0s,2299161j)>, "体育の日"],
      [#<Date: 2017-11-03 ((2458061j,0s,0n),+0s,2299161j)>, "文化の日"],
      [#<Date: 2017-11-23 ((2458081j,0s,0n),+0s,2299161j)>, "勤労感謝の日"],
      [#<Date: 2017-12-23 ((2458111j,0s,0n),+0s,2299161j)>, "天皇誕生日"]]
  ```

* `hash_year(year)` ― ある年について、 {日付=>祝日名} のHashを返す

  ```ruby
  HolidayJapan.hash_year(2017)
  => {#<Date: 2017-01-01 ((2457755j,0s,0n),+0s,2299161j)>=>"元日",
      #<Date: 2017-01-09 ((2457763j,0s,0n),+0s,2299161j)>=>"成人の日",
      #<Date: 2017-02-11 ((2457796j,0s,0n),+0s,2299161j)>=>"建国記念の日",
      #<Date: 2017-04-29 ((2457873j,0s,0n),+0s,2299161j)>=>"昭和の日",
      #<Date: 2017-05-03 ((2457877j,0s,0n),+0s,2299161j)>=>"憲法記念日",
      #<Date: 2017-05-04 ((2457878j,0s,0n),+0s,2299161j)>=>"みどりの日",
      #<Date: 2017-05-05 ((2457879j,0s,0n),+0s,2299161j)>=>"こどもの日",
      #<Date: 2017-07-17 ((2457952j,0s,0n),+0s,2299161j)>=>"海の日",
      #<Date: 2017-08-11 ((2457977j,0s,0n),+0s,2299161j)>=>"山の日",
      #<Date: 2017-09-18 ((2458015j,0s,0n),+0s,2299161j)>=>"敬老の日",
      #<Date: 2017-10-09 ((2458036j,0s,0n),+0s,2299161j)>=>"体育の日",
      #<Date: 2017-11-03 ((2458061j,0s,0n),+0s,2299161j)>=>"文化の日",
      #<Date: 2017-11-23 ((2458081j,0s,0n),+0s,2299161j)>=>"勤労感謝の日",
      #<Date: 2017-12-23 ((2458111j,0s,0n),+0s,2299161j)>=>"天皇誕生日",
      #<Date: 2017-03-20 ((2457833j,0s,0n),+0s,2299161j)>=>"春分の日",
      #<Date: 2017-09-23 ((2458020j,0s,0n),+0s,2299161j)>=>"秋分の日",
      #<Date: 2017-01-02 ((2457756j,0s,0n),+0s,2299161j)>=>"振替休日"}
  ```

* `between(from_date,to_date)` ― from_date から to_date までの祝日について、{日付=>祝日名}のHashを返す

  ```ruby
  HolidayJapan.between(Date.new(2017,4,1),Date.new(2018,3,31))
  => {#<Date: 2017-04-29 ((2457873j,0s,0n),+0s,2299161j)>=>"昭和の日",
      #<Date: 2017-05-03 ((2457877j,0s,0n),+0s,2299161j)>=>"憲法記念日",
      #<Date: 2017-05-04 ((2457878j,0s,0n),+0s,2299161j)>=>"みどりの日",
      #<Date: 2017-05-05 ((2457879j,0s,0n),+0s,2299161j)>=>"こどもの日",
      #<Date: 2017-07-17 ((2457952j,0s,0n),+0s,2299161j)>=>"海の日",
      #<Date: 2017-08-11 ((2457977j,0s,0n),+0s,2299161j)>=>"山の日",
      #<Date: 2017-09-18 ((2458015j,0s,0n),+0s,2299161j)>=>"敬老の日",
      #<Date: 2017-10-09 ((2458036j,0s,0n),+0s,2299161j)>=>"体育の日",
      #<Date: 2017-11-03 ((2458061j,0s,0n),+0s,2299161j)>=>"文化の日",
      #<Date: 2017-11-23 ((2458081j,0s,0n),+0s,2299161j)>=>"勤労感謝の日",
      #<Date: 2017-12-23 ((2458111j,0s,0n),+0s,2299161j)>=>"天皇誕生日",
      #<Date: 2017-09-23 ((2458020j,0s,0n),+0s,2299161j)>=>"秋分の日",
      #<Date: 2018-01-01 ((2458120j,0s,0n),+0s,2299161j)>=>"元日",
      #<Date: 2018-01-08 ((2458127j,0s,0n),+0s,2299161j)>=>"成人の日",
      #<Date: 2018-02-11 ((2458161j,0s,0n),+0s,2299161j)>=>"建国記念の日",
      #<Date: 2018-03-21 ((2458199j,0s,0n),+0s,2299161j)>=>"春分の日",
      #<Date: 2018-02-12 ((2458162j,0s,0n),+0s,2299161j)>=>"振替休日"}
  ```

### 祝日データをCSVに出力

  ```
  $ ruby -r csv -r holiday_japan -e 'CSV.open("holiday.csv","w"){|c| HolidayJapan.between(2016,2018).each{|a| c<<a}}'

  $ head -n3 holiday.csv ; echo ...; tail -n3 holiday.csv
  2016-01-01,元日
  2016-01-11,成人の日
  2016-02-11,建国記念の日
  ...
  2018-11-23,勤労感謝の日
  2018-12-23,天皇誕生日
  2018-12-24,振替休日
  ```

## 祝日データ

* 1948年7月20日(祝日法発令) 以降の祝日に対応
* 2018年の[暦要項](http://eco.mtk.nao.ac.jp/koyomi/yoko/)まで確認（法改正がない限り以降も有効）
* 春分の日・秋分の日の計算は2150年まで

## Author:
    Masahiro TANAKA

## Copyright:
    (C) Copyright 2003-2017 by Masahiro TANAKA
    This program is free software under MIT license.
    See LICENSE.txt.
    NO WARRANTY.

## Version:
    2015-04-11  ver 1.2  hash_year, between 関数追加
    2014-05-23  ver 1.1  「山の日」追加
    2012-12-23  ver 1.0  モジュール名を Holiday から HolidayJapan に変更
    2007-08-02  ver 0.9  リファクタリング
    2007-03-08  ver 0.8  祝日データクラスを統一、データを配列で記述
    2006-02-06  ver 0.7  平成19年(西暦2007年)の暦要項 反映(祝日法改正)
                         Holiday.create_table 修正
                         Holiday.list_year 追加
    2003-10-02  ver 0.6  祝日データ追加
    2003-09-29  ver 0.5
    2003-09-22  ver 0.4
    2003-09-20  ver 0.3
    2003-09-16  ver 0.2
    2003-09-15  ver 0.1
