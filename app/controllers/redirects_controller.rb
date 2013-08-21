class RedirectsController < ApplicationController

  def forward
    if request.fullpath == '/pro'
      redirect_to "http://pro.#{ request.host_with_port }", status: 301
    else
      redirect_to "http://pro.#{ request.host_with_port }#{ request.fullpath }", status: 301
    end
  end

end
