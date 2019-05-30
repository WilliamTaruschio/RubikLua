--[[
      cubo di rubik da 3x3
      un array per la struttura dati 
      
                  +----------+
         *        | 10 11  12| 
         *        | 17 18  13| up yellow
                  | 16 15  14|
         * +------+-------+-------+------+------------+
         * | 1 2 3 | 19 20  21|| 28 29  30|| 37 38  39|
         * | 8 9 4 | 26 27  22|| 35 36  31|| 44 45  40|green orange blue red
         * | 7 6 5 | 25 24  23|| 34 33  32|| 43 42  41|
            +------+-------+-------+------+-----------+
         *        | 46 47  48|
         *        | 53 54  49| down white
                  | 52 51  50|
         *        +----------+
         ]]--

left = {}
for i=1, 9 do
  left[i]=i --left
end
up = {}
for i=10, 18 do
  up[i]=i --up
end
front = {}
for i=19, 27 do
  front[i]=i --front
end
right = {}
for i=28, 36 do
  right[i]=i --right
end
back = {}
for i=37, 45 do
  back[i]=i --back
end
down = {}
for i=46, 54 do
  down[i]=i --down
end


cube = {}
for i=1, 9 do
  cube[i]='green' --left
end
for i=10, 18 do
  cube[i]='yellow'  --up
end
for i=19, 27 do
  cube[i]='orange'  --front
end
for i=28, 36 do
  cube[i]='blue'  --right
end
for i=37, 45 do
  cube[i]='red'  --back
end
for i=46, 54 do
  cube[i]='white'  --down
end
for i=1, 54 do
  print(cube[i])
end


-- ruota una faccia di 90 gradi in senso antiorario oppure orario,
function rotate(side,direction)

  if side ==0   --left
  then
    permutaFaccia(1,2,3,4,5,6,7,8, direction)
    permutaLato(10,19,46,41,direction)
    permutaLato(17,26,53,40,direction)
    permutaLato(16,25,52,39,direction)

  elseif side==1  --back
  then 
    permutaFaccia(37,38,39,40,41,42,43,44,direction)
    permutaLato(1,52,32,12,direction)
    permutaLato(8,51,31,13,direction)
    permutaLato(7,50,30,14,direction)

  elseif side==2 --up
  then 
    permutaFaccia(10,11,12,13,14,15,16,17,direction)
    permutaLato(1,19,28,37,direction)
    permutaLato(2,20,29,38,direction)
    permutaLato(3,21,30,39,direction)

  elseif side==3 --front
  then 
    permutaFaccia(19,20,21,22,23,24,25,26,direction)
    permutaLato(5,16,28,48,direction)
    permutaLato(4,15,35,47,direction)
    permutaLato(3,14,34,46,direction)

  elseif side==4 --right
  then 
    permutaFaccia(28,29,30,31,32,33,34,35,direction)
    permutaLato(12,43,48,21,direction)
    permutaLato(13,44,49,22,direction)
    permutaLato(14,37,50,23,direction)

  elseif side==5  --down
  then 
    permutaFaccia(46,47,48,49,50,51,52,53,direction)
    permutaLato(43,7,25,34,direction)
    permutaLato(42,6,24,33,direction)
    permutaLato(41,5,23,32,direction)
  end

end
--effettua le permutazioni quando si ruota una faccia
function permutaFaccia(a,b,c,d,e,f,g,h,dir)
  temp =cube[a]
  temp2=cube[b]
  if dir==-1 -- senso antiorario
  then 
    cube[a]=cube[c]
    cube[h]=temp2
    cube[b]=cube[d]
    cube[c]=cube[e]
    cube[d]=cube[f]
    cube[e]=cube[g]
    cube[f]=cube[h]
    cube[g]=temp


  elseif dir==1  -- senso orario
  then
    cube[a] =cube[g]
    cube[b]=cube[h]
    cube[h]=cube[f]
    cube[g]=cube[e]
    cube[f]=cube[d]
    cube[e]=cube[c]
    cube[d]=temp2
    cube[c]=temp

  end
end
function permutaLato(a,b,c,d,dir)
  temp =cube[a]
  if dir==-1 -- senso antiorario
  then 
    cube[a] = cube[d]
    cube[d] = cube[c]
    cube[c] = cube[b]
    cube[b] = temp

  elseif dir==1  -- senso orario
  then
    cube[a] = cube[b]
    cube[b] = cube[c]
    cube[c] = cube[d]
    cube[d] = temp;
  end
end

function shuffle()
  for i=0, 50 do
    math.randomseed(i)
    random=math.random(0,5)
    print("random number")
    print(random)
    rotate(random,1)
  end
end
for i=1, 54 do
  print(cube[i])
end
shuffle()-- mischia
print("-----mischiato-----")
for i=1, 54 do
  print(cube[i])
end

function daisyDone() -- controlla se la c'è la falsa croce bianca
  if cube[11] == "white" and cube[13] == "white" and cube[15] == "white" and cube[17] == "white" then return true else return false 
  end
end
function daisy() --fa la margherita
  --[[
  gira prima destra, sinistra, avanti e dietro, potrebbero esserci delle caselle gia in posizione
  poi gira finchè nella faccia FRONT non compare un bianco nel 20 o nel 24 e vedi se la casella da posizionare è occupata
 caso 20 (ALTO): se il 15 e il 13 è libero fai FR
  caso 20 (ALTO): se si tratta dell'ultimo spigolo rimasto fai F U' R
  caso 24 (BASSO)se il 15 e il 13 è libero fai F'R
   caso 24 (BASSO)se il 15 è OCCUPATO e il 13 è libero fai F'R F
  ]]--
  counter=0
  while daisyDone()==false do
    while cube[15]=="white" do
      rotate(2,1) --U
      counter=counter + 1
      -- print("15 bianco")
    end
    if cube[20]=="white" then
      -- print("20 bianco")
      if cube[13]=="white" then
       -- print("20 bianco 13 si")
        rotate(3,1)-- F
        rotate(2,-1)-- U'
        rotate(4,1) --R
        counter=counter + 3
      else
       -- print("20 bianco 13 no")
        rotate(3,1)-- F
        rotate(4,1) --R
        counter=counter + 2
      end
    elseif cube[24]=="white" then
      --print("24 bianco")
      if cube[13]=="white" then
        rotate(3,-1)-- F'
        rotate(2,-1) --U'
        rotate(4,1) --R
        counter=counter + 3
      else
        rotate(3,-1)-- F'
        rotate(4,1) --R
        counter=counter + 2
      end
    end
    --print("giro")
    rotate(3,1)-- F
    rotate(5,1)-- D
    counter=counter + 2
  end
end
function whiteCross() --fa la croce bianca o almeno dovrebbe
  daisy() --margherita
  print(daisyDone())
  while whiteCrossDone()==false do
    if cube[20]==cube[27] and cube[15]=="white" then 
      rotate(3,1)-- F
      rotate(3,1)-- F
counter=counter + 2
    elseif cube[29]==cube[36] and cube[11]=="white" then 
      rotate(4,1) --R
      rotate(4,1) --R
counter=counter + 2
    elseif cube[38]==cube[45] and cube[13]=="white" then 
      rotate(1,1)-- F
      rotate(1,1)-- F
counter=counter + 2
    elseif cube[2]==cube[9] and cube[17]=="white" then 
      rotate(0,1)-- F
      rotate(0,1)-- F
counter=counter + 2
    else 
      rotate(2,-1) --U'
      counter=counter + 1
    end
  end
end
function whiteCrossDone()
  if cube[47] == "white" and cube[49] == "white" and cube[51] == "white" and cube[53] == "white" then return true else return false 
  end
end
print(daisyDone())
print("----croce bianca----")
whiteCross()
print(whiteCrossDone())
print(counter)
print("-------margherita--------")
for i=1, 54 do
  print(cube[i])
end
