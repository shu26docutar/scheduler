require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  before do
      @room = FactoryBot.build(:room)
  end

  describe "roomの新規作成" do
      context "ルーム作成が成功する場合" do
          it "ルーム名が指定されていれば登録ができる" do
              expect(@room).to be_valid 
          end
      end

      context "ルーム作成が失敗する場合" do
          it "ルーム名が空であれば登録はできない" do
              @room.name = " "
              @room.valid?
              expect(@room.errors.full_messages).to include "Nameを入力してください"
          end
      end
  end
end
