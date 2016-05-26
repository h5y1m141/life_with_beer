pictures = [
  { image: File.open("#{Rails.root}/db/pictures/8wired.jpg") },
  { image: File.open("#{Rails.root}/db/pictures/yeastyie.jpg") },
]

pictures.each do |picture_params|
  Picture.create(picture_params)
end

articles = [
  {
    title: 'ニュージーランドのクラフトビールが面白い件',
    thumbnail: File.open("#{Rails.root}/db/pictures/8wired.jpg"),
    publish_status: 1
  }
]

articles.each do |article_params|
  Article.create(article_params)
end

article_elements = [
  {
    article_id: 1,
    tag_name: 'description',
    element_data: '普段、クラフトビールをよく買いに行く中野坂上の藤小西さんというお店でニュージーランドのクラフトビールが入荷してるのを見つけて以降、ニュージーランドのクラフトビールの面白さを知ったので簡単にご紹介',
    sory_key: 1
  },
  {
    article_id: 1,
    tag_name: 'sub_head',
    element_data: 'ホップの産地として有名だったことを最近知った',
    sory_key: 2
  },
  {
    article_id: 1,
    tag_name: 'description',
    element_data: 
      'のグループでクラフトビールが熱いぞ！ニュージーランドという記事を見つけたのですが、そこで「ちなみにNelsonはビール造りに欠かせないホップをニュージーランドで唯一商業用として生産している場所としても知られています。」ということが書かれていました。',
    sory_key: 3
  },
  {
    article_id: 1,
    tag_name: 'description',
    element_data: 
      'またこの記事によると、ネルソン ソーヴィンはニュージーランド産のホップで、パンクIPAにも使用されてるとかなので、元々自分が好きなタイプのクラフトビールには、ニュージーランド産のこのホップ使ったものが多かったんだなぁと最近知りました。',
    sory_key: 4
  },
  {
    article_id: 1,
    tag_name: 'sub_head',
    element_data: '挑戦的な味のものが印象的',
    sory_key: 5
  },
  {
    article_id: 1,
    tag_name: 'description',
    element_data: '8 Wired のHopWired IPAで、グラスに注いだ瞬間からポップのとても良い香りが一気に飛び込んできました。（ちなみに8 Wiredはこういう↓ボトルデザイン）',
    sory_key: 6
  },
  {
    article_id: 1,
    tag_name: 'img',
    element_data: '1',
    sory_key: 7
  },
  {
    article_id: 1,
    tag_name: 'sub_head',
    element_data: 'Yeastie BoysのPot Kettle Blackというのも面白い',
    sory_key: 8
  },
  {
    article_id: 1,
    tag_name: 'description',
    element_data: '結構衝撃的だったのが、最近飲んだYeastie BoysのPot Kettle Black',
    sory_key: 9
  },
  {
    article_id: 1,
    tag_name: 'img',
    element_data: '2',
    sory_key: 10
  },
  {
    article_id: 1,
    tag_name: 'description',
    element_data: 'ホッピーポーターというPOP書いてあった通り最初に凄くマスカットみたいな感じの味わいがガツンと来て、でもポーターと言われるとそうかという味わいもあるし、色々考えつつも、気づいていたらポーターなのにゴクゴク飲んでました^^;',
    sory_key: 11
  },
  {
    article_id: 1,
    tag_name: 'description',
    element_data: 'ちなみに藤小西さんはこちらになりますー',
    sory_key: 12
  },
  {
    article_id: 1,
    tag_name: 'place',
    element_data: '738',
    sory_key: 13
  },
  {
    article_id: 1,
    tag_name: 'description',
    element_data: '銀座エリアの情報をついでに埋め込む',
    sory_key: 14
  },
  {
    article_id: 1,
    tag_name: 'area',
    element_data: '1',
    sory_key: 15
  }  
]

article_elements.each do |element_params|
  ArticleElement.create(element_params)
end
