class PhotoShoutsController < ApplicationController
  def create
    content = build_content
    shout = current_user.shouts.build(content: content)
    # 保存时shout和text_shout都会保存
    if shout.save
      redirect_to dashboard_path
    else
      flash.alert = 'Can\'t shout!'
      redirect_to dashboard_path
    end
  end

  private

  def build_content
    PhotoShout.new(photo_shout_parameters)
  end

  def photo_shout_parameters
    params.require(:photo_shout).permit(:image)
  end
end
