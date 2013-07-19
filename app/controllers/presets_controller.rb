class PresetsController < ApplicationController

  def index
    @presets = Preset.all.sort_by { rand }
  end

  def show
    @preset = Preset.find(params[:id])
  end

end
