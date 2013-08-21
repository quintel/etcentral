class RedirectsController < ApplicationController

  def forward
    if request.fullpath == '/pro'
      redirect_to "http://pro.#{ request.host_with_port }"
    else
      redirect_to "http://pro.#{ request.host_with_port }#{ request.fullpath }"
    end
  end

end
