FactoryGirl.define do
  breweries = [
    {name: 'COEDO', web_site: 'http://www.coedobrewery.com/' },
    {name: 'MiNOH', web_site: 'http://www.minoh-beer.jp/' }
  ]
  factory :brewery do
    name { breweries.sample[:name] }
    web_site { breweries.sample[:web_site] }
  end
end
