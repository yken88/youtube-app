class ChatsController < ApplicationController
    before_action :search, only: [:index]

    def index
    end

    private

    def search
        @live_chat_messages = []
        if params[:video_id]
            @live_chat_messages = live_chat_messages(params[:video_id])
        end
    end

    def live_chat_messages(video_id)
        client = GoogleService.new

        live_detail = client.get_live_details(video_id).items[0]
        live_chat_id = live_detail.live_streaming_details.active_live_chat_id

        if live_chat_id
            live_chat_message_info = client.get_live_chat_message_info(live_chat_id).items
        else
            flash[:nolive] = 'this video is not live'
            redirect_to "/chats"
        end
        
        return live_chat_message_info
    end
end
