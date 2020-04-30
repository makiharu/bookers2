class HomesController < ApplicationController
	#ログインしてないユーザーはログインぺーじに飛ばす。ただし、topとaboutはのぞく
	before_action :authenticate_user!, except: [:top, :about]
  def top
  end
  def about
  end

end
