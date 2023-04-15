require 'google/apis/youtube_v3'

class GoogleService
  
  DEVELOPER_KEY = Rails.application.secrets.youtube_api_key

  def get_live_details(video_id, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = "AIzaSyC2Y2Ktg67wO1Z4ZfO_ZxIhesV06fn95Hs"
  
    next_page_token = nil
    begin
      live_streaming_details = service.list_videos("liveStreamingDetails", id: video_id)
      return live_streaming_details
    end
  end

  def get_live_chat_message_info(live_chat_id)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = "AIzaSyC2Y2Ktg67wO1Z4ZfO_ZxIhesV06fn95Hs"

    next_page_token = nil

    chat_message_info = service.list_live_chat_messages(live_chat_id, "snippet")
    return chat_message_info
  end

end