require 'google/apis/youtube_v3'

class GoogleService
  
  DEVELOPER_KEY = Rails.application.secrets.youtube_api_key

  def get_live_details(video_id, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ""
  
    next_page_token = nil
    begin
      live_streaming_details = service.list_videos("liveStreamingDetails", id: video_id)
      return live_streaming_details.to_json
    end
  end
end