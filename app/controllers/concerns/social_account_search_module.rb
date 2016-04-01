module SocialAccountSearchModule
  def generate_social_account_list
    # {"facebook"=>0, "twitter"=>1, "hatena"=>2・・という構造から
    # [{:index=>0, :name=>"facebook"}, {:index=>1, :name=>"twitter"}という構造に変更するために
    @social_accounts =[]
    SocialAccount.account_types.keys.each_with_index do|account, index|
      @social_accounts.push({index: index, name: account })
    end
    @social_accounts
  end  
end
