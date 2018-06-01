require 'aviao'
require 'meteoro'
require 'colisao'
require 'tiro'

LARGURA_TELA = 320
ALTURA_TELA = 480
MAX_METEOROS = 12
METEOROS_ATINGIDOS = 0 
NUMERO_DE_METEOROS_OBJETIVO = 20

aviao_14bis = {
  src = 'imagens/14bis.png',
  largura = 55, 
  altura = 63,
  x = LARGURA_TELA/2 - 64/2,
  y = ALTURA_TELA - 64/2,
  tiros = {},
}

meteoros = {}

function trocaMusicaDeFundo() 
  musica_ambiente:stop()
  game_over:play()
end

function checaObjetivoConcluido()
  if METEOROS_ATINGIDOS >= NUMERO_DE_METEOROS_OBJETIVO then
      musica_ambiente:stop()
      VENCEDOR = true
      vencedor_som:play()
  end
end

function love.load()
  love.window.setMode(LARGURA_TELA, ALTURA_TELA, { resizable = false })
  love.window.setTitle('14bis vs Meteoros')

  math.randomseed(os.time())

  background = love.graphics.newImage("imagens/background.png")
  gameover_img = love.graphics.newImage("imagens/gameover.png")
  vencedor_img = love.graphics.newImage("imagens/vencedor.png")
  
  aviao_14bis.imagem = love.graphics.newImage(aviao_14bis.src)
  meteoro_img = love.graphics.newImage('imagens/meteoro.png')
  tiro_img = love.graphics.newImage('imagens/tiro.png')

  musica_ambiente = love.audio.newSource("audios/ambiente.wav", "static")
  musica_ambiente:setLooping(true)
  musica_ambiente:play()

  destruicao = love.audio.newSource("audios/destruicao.wav", "static")
  game_over = love.audio.newSource("audios/game_over.wav", "static")
  disparo = love.audio.newSource("audios/disparo.wav", "static")
  vencedor_som = love.audio.newSource("audios/winner.wav", "static")
end

function love.update(dt)
  if not FIM_JOGO and not VENCEDOR then 
    if love.keyboard.isDown('w', 'a', 's', 'd') then
      move14bis()
    end

    removeMeteoros()

    if #meteoros < MAX_METEOROS then
      criaMeteoro()
    end

    moveMeteoros()
    moveTiros()
    checaColisoes()
    checaObjetivoConcluido()
  end
end

function love.keypressed(tecla)
  if tecla == "escape" then
    love.event.quit()
  elseif tecla == "space" then
    darTiro()
  end
end

function love.draw()
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(aviao_14bis.imagem, aviao_14bis.x, aviao_14bis.y)

  love.graphics.print("Meteoros restantes "..NUMERO_DE_METEOROS_OBJETIVO - METEOROS_ATINGIDOS, 0, 0)
  
  for k, meteoro in pairs(meteoros) do
    love.graphics.draw(meteoro_img, meteoro.x, meteoro.y)
  end

  for k, tiro in pairs(aviao_14bis.tiros) do
    love.graphics.draw(tiro_img, tiro.x, tiro.y)
  end

  if FIM_JOGO then
    love.graphics.draw(gameover_img, LARGURA_TELA/2 - gameover_img:getWidth()/2, ALTURA_TELA/2 - gameover_img:getHeight()/2)
  end

  if VENCEDOR then 
    love.graphics.draw(vencedor_img, LARGURA_TELA/2 - gameover_img:getWidth()/2, ALTURA_TELA/2 - gameover_img:getHeight()/2)
  end
end