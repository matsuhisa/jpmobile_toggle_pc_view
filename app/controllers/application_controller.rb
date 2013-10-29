class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Jpmobile::ViewSelector

before_action :force_pc_view
before_filter :disable_mobile_view_if_tablet

# クッキーの中を見てスマホでPCビューを表示する
def force_pc_view
  if cookies[:force_pc_view] == 't'
    disable_mobile_view! # 自動振り分け無効
  end
end

# タブレットは常にPCビューを表示する
def disable_mobile_view_if_tablet
  if request.mobile && request.mobile.tablet?
    disable_mobile_view!
  end
end

end
