function checaColisoesComAviao()
  for k, meteoro in pairs(meteoros) do
    if temColisao(meteoro.x, meteoro.y, meteoro.largura, meteoro.altura, aviao_14bis.x, aviao_14bis.y, aviao_14bis.largura, aviao_14bis.altura) then
      trocaMusicaDeFundo()
      destroiAviao()
      FIM_JOGO = true
    end
  end
end

function checaColisoesComTiros() 
  for i = #aviao_14bis.tiros, 1, -1 do
    for j = #meteoros, 1, -1 do
      if temColisao(aviao_14bis.tiros[i].x, aviao_14bis.tiros[i].y, aviao_14bis.tiros[i].altura, aviao_14bis.tiros[i].largura, meteoros[j].x, meteoros[j].y, meteoros[j].largura, meteoros[j].altura) then
        METEOROS_ATINGIDOS = METEOROS_ATINGIDOS + 1
        table.remove(aviao_14bis.tiros, i)
        table.remove(meteoros, j)
        break
      end
    end
  end
end

function checaColisoes() 
  checaColisoesComAviao()
  checaColisoesComTiros()
end

function temColisao(X1, Y1, L1, A1, X2, Y2, L2, A2)
  return  X2 < X1 + L1 and
          X1 < X2 + L2 and
          X1 < Y2 + A2 and
          Y2 < Y1 + A2 
end 