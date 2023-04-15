class ChatsController < ApplicationController
    def index
        # TODO:リクエストから取れるようにする
        video_id = "jfKfPfyJRdk"
        
        client = GoogleService.new

        live_details = client.get_live_details(video_id)
        live_chat_id = live_details.items[0].live_streaming_details.active_live_chat_id

        @live_chat_messages = set_chat_messages(live_chat_id)
    end

    def set_chat_messages(live_chat_id)
        client = GoogleService.new

        live_chat_message_info = client.get_live_chat_message_info(live_chat_id)
        
        return live_chat_message_info.items
    end
end
