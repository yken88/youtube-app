require 'google/apis/youtube_v3'

class GoogleService
  
  DEVELOPER_KEY = Rails.application.secrets.youtube_api_key

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ""
  
    next_page_token = nil
    begin
      youtube_search_list = service.list_searches("id,snippet", type: "video", q: "キーワード", max_results: 50)

      youtube_search_list.items.each do |item|
        snippet = item.snippet
        puts "\"#{snippet.title}\" by #{snippet.channel_title} (#{snippet.published_at})"
      end
  
    end
  end
end