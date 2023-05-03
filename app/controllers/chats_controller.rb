class ChatsController < ApplicationController
    before_action :search, only: [:index]

    def index
    end

    private

    def search
        if params[:video_id]
            video_id = params[:video_id]
        end

        @live_chat_messages = live_chat_messages(video_id)
    end

    def live_chat_messages(video_id)
        client = GoogleService.new

        live_chat_id = client.get_live_details(video_id).items[0].live_streaming_details.active_live_chat_id
        live_chat_message_info = client.get_live_chat_message_info(live_chat_id)
        
        return live_chat_message_info.items
    end
end
