class ChatsController < ApplicationController
    def index
        video_id = "RSeau4TkGq8"
        
        client = GoogleService.new
        @video_details = client.find_videos("ファイル")
    end
end
