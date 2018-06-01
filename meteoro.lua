function removeMeteoros()
  for i = #meteoros, 1, -1 do
    if meteoros[i].y > ALTURA_TELA then
      table.remove(meteoros, i)
    end
                  
  end
end 

function criaMeteoro() 
  meteoro = {
    x = math.random(LARGURA_TELA),
    y = -70,
    largura = 50,
    altura = 44,    
    peso = math.random(3),
    deslocamento_horizontal = math.random(-1, 1)
  }
  table.insert(meteoros, meteoro)
end

function moveMeteoros()
  for k, meteoro in pairs(meteoros) do
    meteoro.y = meteoro.y + meteoro.peso   
    meteoro.x = meteoro.x + meteoro.deslocamento_horizontal 
  end
end