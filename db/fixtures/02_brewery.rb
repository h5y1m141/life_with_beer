breweries = [
  {
    name: 'COEDO',
    web_site: 'http://www.coedobrewery.com/jp/',
    social_accounts_attributes: [
      {
        account_type: 0,
        url: 'https://www.facebook.com/coedobrewery',
        comment: 'COEDOFacebook公式ページ'
      },
      {
        account_type: 1,
        url: 'https://twitter.com/COEDOBREWERY',
        comment: 'COEDOのTwitter'
      },
      {
        account_type: 4,
        url: 'http://www.coedobrewery.com/blog/feed/atom/',
        comment: 'COEDOのblog'
      },
      {
        account_type: 5,
        url: 'https://www.instagram.com/coedo_usa/',
        comment: 'Instagram'
      }
    ]
  },
  {
    name: 'StoneBrewing',
    web_site: 'http://www.stonebrewing.com/',
    social_accounts_attributes: [
      {
        account_type: 1,
        url: 'https://twitter.com/stonebrewingco',
        comment: 'StoneのTwitter'
      }
    ]
  },
  {
    name: '箕面ビール',
    web_site: 'http://www.minoh-beer.jp/',
    social_accounts_attributes: [
      {
        account_type: 0,
        url: 'https://www.facebook.com/MINOHBEER/',
        comment: 'Facebook公式ページ'
      },
      {
        account_type: 1,
        url: 'https://twitter.com/minohbeer',
        comment: 'Twitter'
      },
      {
        account_type: 4,
        url: 'http://minohbeer.blog62.fc2.com/?xml',
        comment: 'オフィシャルブログ'
      }
    ]
  },
  {
    name: 'キリンビール',
    web_site: 'http://www.kirin.co.jp/',
    social_accounts_attributes: [
      {
        account_type: 0,
        url: 'https://www.facebook.com/kirinbeer',
        comment: 'Facebook公式ページ'
      },
      {
        account_type: 1,
        url: 'https://twitter.com/kirin_brewery',
        comment: 'Twitter'
      }
    ]
  }
]
breweries.each do |brewery_params|
  Brewery.create(brewery_params)
end
