function move14bis()
  if love.keyboard.isDown('w') then
    aviao_14bis.y = aviao_14bis.y - 1
  end

  if love.keyboard.isDown('s') then
    aviao_14bis.y = aviao_14bis.y + 1
  end

  if love.keyboard.isDown('a') then
    aviao_14bis.x = aviao_14bis.x - 1
  end

  if love.keyboard.isDown('d') then
    aviao_14bis.x = aviao_14bis.x + 1
  end
end

function destroiAviao()
  destruicao:play()
  aviao_14bis.src = "imagens/explosao_nave.png"
  aviao_14bis.imagem = love.graphics.newImage(aviao_14bis.src)
  aviao_14bis.largura = 67
  aviao_14bis.altura = 77
end
