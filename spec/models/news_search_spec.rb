require 'json'
require_relative '../../lib/news_search.rb'



RSpec.describe News do

   before(:each) do
     @mock_data = '{"response":{"status":"ok","userTier":"developer","total":2303,"startIndex":1,"pageSize":10,"currentPage":1,"pages":231,"orderBy":"newest","results":[{"id":"culture/2023/feb/11/kylie-ultra-violet-kim-petras-worldpride-festival-has-something-for-everyone-ceo-says","type":"article","sectionId":"culture","sectionName":"Culture","webPublicationDate":"2023-02-10T22:45:42Z","webTitle":"Kylie, Ultra Violet, Kim Petras: WorldPride festival has ‘something for everyone’, CEO says","webUrl":"https://www.theguardian.com/culture/2023/feb/11/kylie-ultra-violet-kim-petras-worldpride-festival-has-something-for-everyone-ceo-says","apiUrl":"https://content.guardianapis.com/culture/2023/feb/11/kylie-ultra-violet-kim-petras-worldpride-festival-has-something-for-everyone-ceo-says","fields":{"headline":"Kylie, Ultra Violet, Kim Petras: WorldPride festival has ‘something for everyone’, CEO says","byline":"Josh Taylor","thumbnail":"https://media.guim.co.uk/08ba0096d9011c998338493e00ea87f008d32bb3/0_0_4529_2718/500.jpg"},"isHosted":false,"pillarId":"pillar/arts","pillarName":"Arts"}]}'
   end

  it "calls an API returning a response" do
    
    news = News.new("something")
    allow(news).to receive(:make_call_to_api)
    .and_return(@mock_data)

    result = news.make_call_to_api
    expect(result).to eq ('{"response":{"status":"ok","userTier":"developer","total":2303,"startIndex":1,"pageSize":10,"currentPage":1,"pages":231,"orderBy":"newest","results":[{"id":"culture/2023/feb/11/kylie-ultra-violet-kim-petras-worldpride-festival-has-something-for-everyone-ceo-says","type":"article","sectionId":"culture","sectionName":"Culture","webPublicationDate":"2023-02-10T22:45:42Z","webTitle":"Kylie, Ultra Violet, Kim Petras: WorldPride festival has ‘something for everyone’, CEO says","webUrl":"https://www.theguardian.com/culture/2023/feb/11/kylie-ultra-violet-kim-petras-worldpride-festival-has-something-for-everyone-ceo-says","apiUrl":"https://content.guardianapis.com/culture/2023/feb/11/kylie-ultra-violet-kim-petras-worldpride-festival-has-something-for-everyone-ceo-says","fields":{"headline":"Kylie, Ultra Violet, Kim Petras: WorldPride festival has ‘something for everyone’, CEO says","byline":"Josh Taylor","thumbnail":"https://media.guim.co.uk/08ba0096d9011c998338493e00ea87f008d32bb3/0_0_4529_2718/500.jpg"},"isHosted":false,"pillarId":"pillar/arts","pillarName":"Arts"}]}')
  end

  context '#results' do

    it "returns the headline of a given news_item" do
      
      fake_data = double :make_call_to_api

      allow(fake_data).to receive(:make_call_to_api)
      .and_return((@mock_data))

      news = News.new("something")
      news_item = news.results_only.first
      result = news.headline(news_item)
      expect(result).to eq "Kylie, Ultra Violet, Kim Petras: WorldPride festival has ‘something for everyone’, CEO says".to_s
    end

    it "returns the publication_date of a given news_item" do
      
      fake_data = double :make_call_to_api

      allow(fake_data).to receive(:make_call_to_api)
      .and_return((@mock_data))

      news = News.new("something")
      news_item = news.results_only.first
      result = news.published?(news_item)
      expect(result).to eq "10-02-2023"
    end

    it "returns the thumbnail of a given news_item" do
      
      fake_data = double :make_call_to_api

      allow(fake_data).to receive(:make_call_to_api)
      .and_return((@mock_data))

      news = News.new("something")
      news_item = news.results_only.first
      result = news.thumbnail(news_item)
      expect(result).to eq "https://media.guim.co.uk/08ba0096d9011c998338493e00ea87f008d32bb3/0_0_4529_2718/500.jpg".to_s
    end

    it "returns the category of a given news_item" do
      
      fake_data = double :make_call_to_api
      allow(fake_data).to receive(:make_call_to_api)
      .and_return((@mock_data))

      news = News.new("something")
      news_item = news.results_only.first
      result = news.category(news_item)
      expect(result).to eq "Culture"
    end

    it "returns the author of a given news_item" do
      
      fake_data = double :make_call_to_api
      allow(fake_data).to receive(:make_call_to_api)
      .and_return((@mock_data))

      news = News.new("something")
      news_item = news.results_only.first
      result = news.author(news_item)
      expect(result).to eq "Josh Taylor"
    end

    it "returns the webURL of a given news_item" do
      
      fake_data = double :make_call_to_api
      allow(fake_data).to receive(:make_call_to_api)
      .and_return((@mock_data))

      news = News.new("something")
      news_item = news.results_only.first
      result = news.link(news_item)
      expect(result).to eq "https://www.theguardian.com/culture/2023/feb/11/kylie-ultra-violet-kim-petras-worldpride-festival-has-something-for-everyone-ceo-says".to_s
    end

  end

end
