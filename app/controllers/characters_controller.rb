class CharactersController < ApplicationController
  before_action :set_game, only: [:index, :create, :render_json]
  before_action :set_character, only: [:show, :update, :destroy]

  def index
    @characters = @game.characters
  end

  def show
    @character = @game.character
  end

  def create
    @character = @game.characters.new(character_params)
    if @character.save
      render json: @character
    else
      render_error(@character)
    end
  end

  def update
    if @character.update(character_params)
      render json: @character
    else
      render_error(@character)
    end
  end

  def destroy
    @character.destroy
    render json: { message: 'removed' }, status: :ok
  end

  def render_json
    render json: @game.characters
  end

  private

    def set_game
      @game = Game.find(params[:game_id])
    end

    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:name, :power)
    end
end
