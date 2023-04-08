class ChatsController < ApplicationController
    def index
        # TODO:リクエストから取れるようにする
        video_id = "jfKfPfyJRdk"
        
        client = GoogleService.new
        @chat_id = client.get_live_details(video_id)
    end
end
