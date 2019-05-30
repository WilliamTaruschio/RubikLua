
--[[
rappresentazione del cubo tramite una matrice 3x3x3
tramite assi cartesiani x,y,z con valore ammessi -1,0,1
lista 
]]--

local cube = {}          -- create the matrix
for i=-1,1,1 do
  cube[i] = {}     -- create a new row
  for j=-1,1,1 do
    cube[i][j] = {}
    for k=-1,1,1 do
      cube[i][j][k] = {}

    end
  end
end

----------------------------------------------------------
-- CUBO NORMALE IN CUI SI EFFETTUANO LE OPERAZIONI
----------------------------------------------------------

-- definizione cubetti, associazione coordinate-etichetta
cube[-1][-1][-1]="WGR"
cube[-1][-1][0]="GR"
cube[-1][-1][1]="YGR"
cube[-1][0][-1]="WR"
cube[-1][0][0]="0"
cube[-1][0][1]="YR"
cube[-1][1][-1]="WBR"
cube[-1][1][0]="BR"
cube[-1][1][1]="YRB"

cube[0][-1][-1]="WG"
cube[0][-1][0]="0"
cube[0][-1][1]="YG"
cube[0][0][-1]="0"
cube[0][0][0]="0"
cube[0][0][1]="0"
cube[0][1][-1]="WB"
cube[0][1][0]="0"
cube[0][1][1]="YB"

cube[1][-1][-1]="WOG"
cube[1][-1][0]="GO"
cube[1][-1][1]="YGO"
cube[1][0][-1]="WO"
cube[1][0][0]="0"
cube[1][0][1]="YO"
cube[1][1][-1]="WBO"
cube[1][1][0]="BO"
cube[1][1][1]="YBO"

--Genero il cubo per il confronto

local cubeFinal = {}          -- create the matrix
for i=-1,2 do
  cubeFinal[i] = {}     -- create a new row
  for j=-1,2 do
    cubeFinal[i][j] = {}
    for z=-1,2 do
      cubeFinal[i][j][z] = {}
    end
  end
end
----------------------------------------------------------
-- CUBO NELLA CONFIGURAZIONE FINALE
----------------------------------------------------------

cubeFinal[-1][-1][-1]="WGR"
cubeFinal[-1][-1][0]="GR"
cubeFinal[-1][-1][1]="YGR"
cubeFinal[-1][0][-1]="WR"
cubeFinal[-1][0][0]="0"
cubeFinal[-1][0][1]="YR"
cubeFinal[-1][1][-1]="WBR"
cubeFinal[-1][1][0]="BR"
cubeFinal[-1][1][1]="YRB"

cubeFinal[0][-1][-1]="WG"
cubeFinal[0][-1][0]="0"
cubeFinal[0][-1][1]="YG"
cubeFinal[0][0][-1]="0"
cubeFinal[0][0][0]="0"
cubeFinal[0][0][1]="0"
cubeFinal[0][1][-1]="WB"
cubeFinal[0][1][0]="0"
cubeFinal[0][1][1]="YB"

cubeFinal[1][-1][-1]="WOG"
cubeFinal[1][-1][0]="GO"
cubeFinal[1][-1][1]="YGO"
cubeFinal[1][0][-1]="WO"
cubeFinal[1][0][0]="0"
cubeFinal[1][0][1]="YO"
cubeFinal[1][1][-1]="WBO"
cubeFinal[1][1][0]="BO"
cubeFinal[1][1][1]="YBO"

----------------------------------------------------
-- CONTROLLA I DUE CUBI
----------------------------------------------------

cubeControl = function()

  for i=-1,1 do
    ok = true
    for j=-1,1 do
      for z=-1,1 do
        if(cube[i][j][z] ~= cubeFinal[i][j][z]) then
          ok=false
        end
      end
    end
  end
  return ok
end
--print(cubeControl())


-------------------------------------------------------
--Metodi per trovare gli indici X Y Z
--------------------------------------------------------


findIndexX = function(nome) 
  for i=-1,1 do

    for j=-1,1 do

      for z=-1,1 do
        if(cube[i][j][z]==nome) then
          return i
        end
      end
    end
  end
end
findIndexY = function(nome) 
  for i=-1,1 do

    for j=-1,1 do

      for z=-1,1 do
        if(cube[i][j][z]==nome) then
          return j
        end
      end
    end
  end
end
findIndexZ = function(nome) 
  for i=-1,1 do

    for j=-1,1 do

      for z=-1,1 do
        if(cube[i][j][z]==nome) then
          return z
        end
      end
    end
  end
end
findIndexXYZ = function(nome) --ritorna array
  for i=-1,1 do

    for j=-1,1 do

      for z=-1,1 do
        if(cube[i][j][z]==nome) then
          coord={i,j,z}
          return coord
        end
      end
    end
  end
end


------------------------------------------------------------

-- INIZIO DESCRIZIONE MOSSE 

-----------------------------------------------------------
function destraOrario() --permutazione destra orario 
  --permutazione angoli
  appoggio=cube[1][1][1]
  cube[1][1][1]=cube[1][1][-1]
  cube[1][1][-1]=cube[-1][1][-1]
  cube[-1][1][-1]=cube[-1][1][1]
  cube[-1][1][1]=appoggio
  --permutazione spigoli
  appoggio=cube[0][1][1]
  cube[0][1][1]=cube[1][1][0]
  cube[1][1][0]=cube[0][1][-1]
  cube[0][1][-1]=cube[-1][1][0]
  cube[-1][1][0]=appoggio
end
function destraAntiOrario() --permutazione destra orario 
  --permutazione angoli
  appoggio=cube[1][1][1]
  cube[1][1][1]=cube[-1][1][1]
  cube[-1][1][1]=cube[-1][1][-1]
  cube[-1][1][-1]=cube[1][1][-1]
  cube[1][1][-1]=appoggio
  --permutazione spigoli
  appoggio=cube[0][1][1]
  cube[0][1][1]=cube[-1][1][0]
  cube[-1][1][0]=cube[0][1][-1]
  cube[0][1][-1]=cube[1][1][0]
  cube[1][1][0]=appoggio
end
function sinistraOrario() --permutazione sinistra orario 
  --permutazione angoli
  appoggio=cube[1][-1][1]
  cube[1][-1][1]=cube[-1][-1][1]
  cube[-1][-1][1]=cube[-1][-1][-1]
  cube[-1][-1][-1]=cube[1][-1][-1]
  cube[1][-1][-1]=appoggio
  --permutazione spigoli
  appoggio=cube[0][-1][1]
  cube[0][-1][1]=cube[-1][-1][0]
  cube[-1][-1][0]=cube[0][-1][-1]
  cube[0][-1][-1]=cube[1][-1][0]
  cube[1][-1][0]=appoggio

end
function sinistraAntiOrario() --permutazione sinistra orario 
  --permutazione angoli
  appoggio=cube[1][-1][1]
  cube[1][-1][1]=cube[1][-1][-1]
  cube[1][-1][-1]=cube[-1][-1][-1]
  cube[-1][-1][-1]=cube[-1][-1][1]
  cube[-1][-1][1]=appoggio
  --permutazione spigoli
  appoggio=cube[0][-1][1]
  cube[0][-1][1]=cube[1][-1][0]
  cube[1][-1][0]=cube[0][-1][-1]
  cube[0][-1][-1]=cube[-1][-1][0]
  cube[-1][-1][0]=appoggio

end
function fronteOrario() --permutazione fronte orario 
  --permutazione angoli
  appoggio=cube[1][1][1]
  cube[1][1][1]=cube[1][-1][1]
  cube[1][-1][1]=cube[1][-1][-1]
  cube[1][-1][-1]=cube[1][1][-1]
  cube[1][1][-1]=appoggio
  --permutazione spigoli
  appoggio=cube[1][0][1]
  cube[1][0][1]=cube[1][-1][0]
  cube[1][-1][0]=cube[1][0][-1]
  cube[1][0][-1]=cube[1][1][0]
  cube[1][1][0]=appoggio

end
function fronteAntiOrario() --permutazione fronte orario 
  --permutazione angoli
  appoggio=cube[1][1][1]
  cube[1][1][1]=cube[1][1][-1]
  cube[1][1][-1]=cube[1][-1][-1]
  cube[1][-1][-1]=cube[1][-1][1]
  cube[1][-1][1]=appoggio
  --permutazione spigoli
  appoggio=cube[1][0][1]
  cube[1][0][1]=cube[1][1][0]
  cube[1][1][0]=cube[1][0][-1]
  cube[1][0][-1]=cube[1][-1][0]
  cube[1][-1][0]=appoggio

end
upAntiOrario = function()
  --Muovo gli angoli
  appoggio=cube[1][-1][1]
  cube[1][-1][1]=cube[-1][-1][1]
  cube[-1][-1][1]=cube[-1][1][1]
  cube[-1][1][1]=cube[1][1][1]
  cube[1][1][1]=appoggio
  --Muovo gli spigoli
  appoggio=cube[1][0][1]
  cube[1][0][1]=cube[0][-1][1]
  cube[0][-1][1]=cube[-1][0][1]
  cube[-1][0][1]=cube[0][1][1]
  cube[0][1][1]=appoggio
end
upOrario = function()
  --Muovo gli angoli
  appoggio=cube[1][-1][1]
  cube[1][-1][1]=cube[1][1][1]
  cube[1][1][1]=cube[-1][1][1]
  cube[-1][1][1]=cube[-1][-1][1]
  cube[-1][-1][1]=appoggio
  --Muovo gli spigoli
  appoggio=cube[1][0][1]
  cube[1][0][1]=cube[0][1][1]
  cube[0][1][1]=cube[-1][0][1]
  cube[-1][0][1]=cube[0][-1][1]
  cube[0][-1][1]=appoggio
end
downOrario = function()
  appoggio=cube[1][-1][-1]
  cube[1][-1][-1]=cube[-1][-1][-1]
  cube[-1][-1][-1]=cube[-1][1][-1]
  cube[-1][1][-1]=cube[1][1][-1]
  cube[1][1][-1]=appoggio

  appoggio=cube[1][0][-1]
  cube[1][0][-1]=cube[0][-1][-1]
  cube[0][-1][-1]=cube[-1][0][-1]
  cube[-1][0][-1]=cube[0][1][-1]
  cube[0][1][-1]=appoggio
end
downAntiOrario = function()
  appoggio=cube[1][-1][-1]
  cube[1][-1][-1]=cube[1][1][-1]
  cube[1][1][-1]=cube[-1][1][-1]
  cube[-1][1][-1]=cube[-1][-1][-1]
  cube[-1][-1][-1]=appoggio

  appoggio=cube[1][0][-1]
  cube[1][0][-1]=cube[0][1][-1]
  cube[0][1][-1]=cube[-1][0][-1]
  cube[-1][0][-1]=cube[0][-1][-1]
  cube[0][-1][-1]=appoggio
end
backOrario = function()
  appoggio=cube[-1][1][1]
  cube[-1][1][1]=cube[-1][1][-1]
  cube[-1][1][-1]=cube[-1][-1][-1]
  cube[-1][-1][-1]=cube[-1][-1][1]
  cube[-1][-1][1]= appoggio

  appoggio=cube[-1][0][1]
  cube[-1][0][1]=cube[-1][1][0]
  cube[-1][1][0]=cube[-1][0][-1]
  cube[-1][0][-1]=cube[-1][-1][0]
  cube[-1][-1][0]=appoggio
end
backAntiOrario = function()
  appoggio=cube[-1][1][1]
  cube[-1][1][1]=cube[-1][-1][1]
  cube[-1][-1][1]=cube[-1][-1][-1]
  cube[-1][-1][-1]=cube[-1][1][-1]
  cube[-1][-1][-1]= appoggio

  appoggio=cube[-1][0][1]
  cube[-1][0][1]=cube[-1][-1][0]
  cube[-1][-1][0]=cube[-1][0][-1]
  cube[-1][0][-1]=cube[-1][1][0]
  cube[-1][1][0]=appoggio
end

------------------------------------------------------------

-- FINE DESCRIZIONE MOSSE 

-----------------------------------------------------------

-- euristica per calcolare la distanza
manhattanDistance = function()
  sum = 0
  for i=-1,1 do
    for j=-1,1 do
      for z=-1,1 do
        io.write(cube[i][j][z],"--------->  ")
        x1 = findIndexX(cube[i][j][z],cube)
        y1 = findIndexY(cube[i][j][z],cube)
        z1 = findIndexZ(cube[i][j][z],cube)        
        io.write(" [X1: ", x1," Y1: ", y1," Z1: ", z1,"] ")
        x2=  findIndexX(cube[i][j][z],cubeFinal)
        y2 = findIndexY(cube[i][j][z],cubeFinal)        
        z2 = findIndexZ(cube[i][j][z],cubeFinal)
        io.write(" [X2: ", x2," Y2: ", y2," Z2: ", z2,"] ")
        -- print(x2)
        x= math.abs(x1-x2)
        --math.abs(x)
        y=math.abs(y1-y2)
        z=math.abs(z1-z2)        
        sum = sum + (x + y + z)
        io.write(" X: ",x," Y: ",y," Z: ",z)
        io.write(" somma ",sum,"\n")
      end
    end
  end
  return sum
end

printCube = function (cube)
  for i=-1,1 do

    for j=-1,1 do
      for z=-1,1 do
        io.write("x: ",i," y: ",j," z: ",z,"  ")
        print(cube[i][j][z])
      end
    end
  end
end



io.write("somma totale:  ",manhattanDistance(),"\n")
--printCube(cubeFinal)


---------------------------------------------------------------

-- A-STAR ALGORITHM

---------------------------------------------------------------
----------------------------------------------------------------
-- local variables
----------------------------------------------------------------

local INF = 1/0
local cachedPaths = nil

----------------------------------------------------------------
-- local functions
----------------------------------------------------------------

function dist ( x1, y1, x2, y2 )

  return math.sqrt ( math.pow ( x2 - x1, 2 ) + math.pow ( y2 - y1, 2 ) )
end

function dist_between ( nodeA, nodeB )

  return dist ( nodeA.x, nodeA.y, nodeB.x, nodeB.y )
end

function heuristic_cost_estimate ( nodeA, nodeB )

  return dist ( nodeA.x, nodeA.y, nodeB.x, nodeB.y )
end

function is_valid_node ( node, neighbor )

  return true
end

function lowest_f_score ( set, f_score )

  local lowest, bestNode = INF, nil
  for _, node in ipairs ( set ) do
    local score = f_score [ node ]
    if score < lowest then
      lowest, bestNode = score, node
    end
  end
  return bestNode
end

function neighbor_nodes ( theNode, nodes )

  local neighbors = {}
  for _, node in ipairs ( nodes ) do
    if theNode ~= node and is_valid_node ( theNode, node ) then
      table.insert ( neighbors, node )
    end
  end
  return neighbors
end

function not_in ( set, theNode )

  for _, node in ipairs ( set ) do
    if node == theNode then return false end
  end
  return true
end

function remove_node ( set, theNode )

  for i, node in ipairs ( set ) do
    if node == theNode then 
      set [ i ] = set [ #set ]
      set [ #set ] = nil
      break
    end
  end	
end

function unwind_path ( flat_path, map, current_node )

  if map [ current_node ] then
    table.insert ( flat_path, 1, map [ current_node ] ) 
    return unwind_path ( flat_path, map, map [ current_node ] )
  else
    return flat_path
  end
end

----------------------------------------------------------------
-- pathfinding functions
----------------------------------------------------------------

function a_star ( start, goal, nodes, valid_node_func )

  local closedset = {}
  local openset = { start }
  local came_from = {}

  if valid_node_func then is_valid_node = valid_node_func end

  local g_score, f_score = {}, {}
  g_score [ start ] = 0
  f_score [ start ] = g_score [ start ] + heuristic_cost_estimate ( start, goal )

  while #openset > 0 do

    local current = lowest_f_score ( openset, f_score )
    if current == goal then
      local path = unwind_path ( {}, came_from, goal )
      table.insert ( path, goal )
      return path
    end

    remove_node ( openset, current )		
    table.insert ( closedset, current )

    local neighbors = neighbor_nodes ( current, nodes )
    for _, neighbor in ipairs ( neighbors ) do 
      if not_in ( closedset, neighbor ) then

        local tentative_g_score = g_score [ current ] + dist_between ( current, neighbor )

        if not_in ( openset, neighbor ) or tentative_g_score < g_score [ neighbor ] then 
          came_from 	[ neighbor ] = current
          g_score 	[ neighbor ] = tentative_g_score
          f_score 	[ neighbor ] = g_score [ neighbor ] + heuristic_cost_estimate ( neighbor, goal )
          if not_in ( openset, neighbor ) then
            table.insert ( openset, neighbor )
          end
        end
      end
    end
  end
  return nil -- no valid path
end

----------------------------------------------------------------
-- exposed functions
----------------------------------------------------------------

function clear_cached_paths ()

  cachedPaths = nil
end

function distance ( x1, y1, x2, y2 )

  return dist ( x1, y1, x2, y2 )
end

function path ( start, goal, nodes, ignore_cache, valid_node_func )

  if not cachedPaths then cachedPaths = {} end
  if not cachedPaths [ start ] then
    cachedPaths [ start ] = {}
  elseif cachedPaths [ start ] [ goal ] and not ignore_cache then
    return cachedPaths [ start ] [ goal ]
  end

  local resPath = a_star ( start, goal, nodes, valid_node_func )
  if not cachedPaths [ start ] [ goal ] and not ignore_cache then
    cachedPaths [ start ] [ goal ] = resPath
  end

  return resPath
end