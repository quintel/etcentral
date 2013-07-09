class PresetsController < ApplicationController

  def index
    @presets = Preset.all
  end

  def show
    @preset = Preset.find(params[:id])
  end

end
