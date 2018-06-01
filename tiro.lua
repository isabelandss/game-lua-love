function darTiro() 
  disparo:play()
  local tiro = {
    x = aviao_14bis.x + aviao_14bis.largura/2,
    y = aviao_14bis.y,
    largura = 16,
    altura = 16
  }

  table.insert(aviao_14bis.tiros, tiro)
end

function moveTiros()
  for i = #aviao_14bis.tiros, 1, -1 do
    if aviao_14bis.tiros[i].y > 0 then
      aviao_14bis.tiros[i].y = aviao_14bis.tiros[i].y - 1
    else
      table.remove(aviao_14bis.tiros, i)
    end
  end
end