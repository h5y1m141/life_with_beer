items = [
  {
    name: "StoneIPA",
    url: "http://www.stonebrewing.com/beer/year-round-releases/stone-ipa",
    original_price: nil,
    discounted: nil,
    discount_price: nil,
    description: "アメリカの西海岸（サンディエゴ）のブリュワーさんが作ってるビールです。\r\n\r\nIPAの中でもかなり苦味が強くラベルのデザインに悪魔（ガーゴイル）があしらわれているのですが、そのデザインイメージそのもので、悪魔的な苦味なのですが一度ハマると普通のIPAでは物足りなくなります。\r\n",
    image: File.open("#{Rails.root}/db/pictures/stone.png"),
    original_image_url: "http://www.stonebrewing.com/beer/year-round-releases/stone-ipa",
    ibu: 77
  },
  {
    name: "COEDO紅赤",
    url: "http://www.coedobrewery.com/jp/beers/#beers05",
    original_price: nil,
    discounted: nil,
    discount_price: nil,
    description: "綺麗な琥珀色で、2015年2月にエールタイプにリニューアルしてから、独特の甘みと香ばしさが感じられるビールです\r\n\r\n苦味は抑え目で飲みやすいですが、結構アルコール度数が高いので飲み過ぎに注意！",
    image: File.open("#{Rails.root}/db/pictures/coedo-beniaka.png"),
    original_image_url: "http://www.coedobrewery.com/jp/beers/#beers05",
    ibu: 15
  }
]
items.each do |item_params|
  Item.create(item_params)
end
