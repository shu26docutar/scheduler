require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  before do 
      @event = FactoryBot.build(:event)
  end
  
  describe "スケジュール登録" do
    context "スケジュール登録が成功する場合" do
      it "title,plan,comment,url,place,start_tileがあれば登録できること" do
        expect(@event).to be_valid 
      end
    end

    context "スケジュール登録が失敗する場合" do
      it "titleなしでは登録ができない" do
        @event.title = " "
        @event.valid?
        expect(@event.errors.full_messages).to include "Titleを入力してください"
      end

      it "正しいurlでなければurlは登録できない" do
        @event.url = "hello"
        @event.valid?
        expect(@event.errors.full_messages).to include "Urlはhttpから開始してください"
      end
    end
  end 
end