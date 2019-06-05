--[[
rappresentazione del cubo tramite una matrice 3x3x3
tramite assi cartesiani x,y,z con valore ammessi -1,0,1
lista 
]] --



Cube={}
function Cube:create( cube)
  -- creazione nuova tabella
  -- se non ne viene fornita una
  self.cube= cube or {}
  setmetatable(self.cube,self)
  self.__index = self.cube
  -- body
  return self
end

cuboIniziale=Cube:create()
cuboFinale = Cube:create()
--cuboStronzo=Cube:create()

function Cube:initialize()
  for i = -1, 1, 1 do
   self.cube[i] = {} -- create a new row
    for j = -1, 1, 1 do
      self.cube[i][j] = {}
      for k = -1, 1, 1 do
        self.cube[i][j][k] = {}
      end
    end
  end
end
cuboIniziale:initialize()
cuboFinale:initialize()
--cuboStronzo:initialize()

----------------------------------------------------------
-- CUBO NORMALE IN CUI SI EFFETTUANO LE OPERAZIONI
----------------------------------------------------------

-- definizione cuboIniziale.cubetti, associazione coordinate-etichetta
cuboIniziale.cube[-1][-1][-1] = "WGR"
cuboIniziale.cube[-1][-1][0] = "GR"
cuboIniziale.cube[-1][-1][1] = "YGR"
cuboIniziale.cube[-1][0][-1] = "WR"
cuboIniziale.cube[-1][0][0] = "0"
cuboIniziale.cube[-1][0][1] = "YR"
cuboIniziale.cube[-1][1][-1] = "WBR"
cuboIniziale.cube[-1][1][0] = "BR"
cuboIniziale.cube[-1][1][1] = "YRB"

cuboIniziale.cube[0][-1][-1] = "WG"
cuboIniziale.cube[0][-1][0] = "0"
cuboIniziale.cube[0][-1][1] = "YG"
cuboIniziale.cube[0][0][-1] = "0"
cuboIniziale.cube[0][0][0] = "0"
cuboIniziale.cube[0][0][1] = "0"
cuboIniziale.cube[0][1][-1] = "WB"
cuboIniziale.cube[0][1][0] = "0"
cuboIniziale.cube[0][1][1] = "YB"

cuboIniziale.cube[1][-1][-1] = "WOG"
cuboIniziale.cube[1][-1][0] = "GO"
cuboIniziale.cube[1][-1][1] = "YGO"
cuboIniziale.cube[1][0][-1] = "WO"
cuboIniziale.cube[1][0][0] = "0"
cuboIniziale.cube[1][0][1] = "YO"
cuboIniziale.cube[1][1][-1] = "WBO"
cuboIniziale.cube[1][1][0] = "BO"
cuboIniziale.cube[1][1][1] = "YBO"

cuboStronzo.cube=cuboIniziale.cube
--Genero il cubo per il confronto

----------------------------------------------------------
-- CUBO NELLA CONFIGURAZIONE FINALE
----------------------------------------------------------

cuboFinale.cube[-1][-1][-1] = "WGR"
cuboFinale.cube[-1][-1][0] = "GR"
cuboFinale.cube[-1][-1][1] = "YGR"
cuboFinale.cube[-1][0][-1] = "WR"
cuboFinale.cube[-1][0][0] = "0"
cuboFinale.cube[-1][0][1] = "YR"
cuboFinale.cube[-1][1][-1] = "WBR"
cuboFinale.cube[-1][1][0] = "BR"
cuboFinale.cube[-1][1][1] = "YRB"

cuboFinale.cube[0][-1][-1] = "WG"
cuboFinale.cube[0][-1][0] = "0"
cuboFinale.cube[0][-1][1] = "YG"
cuboFinale.cube[0][0][-1] = "0"
cuboFinale.cube[0][0][0] = "0"
cuboFinale.cube[0][0][1] = "0"
cuboFinale.cube[0][1][-1] = "WB"
cuboFinale.cube[0][1][0] = "0"
cuboFinale.cube[0][1][1] = "YB"

cuboFinale.cube[1][-1][-1] = "WOG"
cuboFinale.cube[1][-1][0] = "GO"
cuboFinale.cube[1][-1][1] = "YGO"
cuboFinale.cube[1][0][-1] = "WO"
cuboFinale.cube[1][0][0] = "0"
cuboFinale.cube[1][0][1] = "YO"
cuboFinale.cube[1][1][-1] = "WBO"
cuboFinale.cube[1][1][0] = "BO"
cuboFinale.cube[1][1][1] = "YBO"

----------------------------------------------------
-- CONTROLLA I DUE CUBI
----------------------------------------------------

function Cube:cubeControl()
  for i = -1, 1 do
    ok = true
    for j = -1, 1 do
      for z = -1, 1 do
        if (cuboIniziale.cube[i][j][z] ~= cuboFinale.cube[i][j][z]) then
          ok = false
        end
      end
    end
  end
  return ok
end


function control(cubo1, cubo2)
  for i = -1, 1 do
    ok = true
    for j = -1, 1 do
      for z = -1, 1 do
        if (cubo1.cube[i][j][z] ~= cubo2.cube[i][j][z]) then
          ok = false
        end
      end
    end
  end
  return ok
end
--print(cuboIniziale.cubeControl())

-------------------------------------------------------
--Metodi per trovare gli indici X Y Z
--------------------------------------------------------

function findIndexX(nome, Cube)
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        if (Cube.cube[i][j][z] == nome) then
          return i
        end
      end
    end
  end
end
function findIndexY(nome, Cube)
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        if (Cube.cube[i][j][z] == nome) then
          return j
        end
      end
    end
  end
end
function findIndexZ(nome, Cube)
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        if (Cube.cube[i][j][z] == nome) then
          return z
        end
      end
    end
  end
end


------------------------------------------------------------

-- INIZIO DESCRIZIONE MOSSE

-----------------------------------------------------------

 mosse = {}
function Cube:destraOrario() --permutazione destra orario
  --permutazione angoli
  appoggio = self.cube[1][1][1]
  self.cube[1][1][1] = self.cube[1][1][-1]
  self.cube[1][1][-1] = self.cube[-1][1][-1]
  self.cube[-1][1][-1] = self.cube[-1][1][1]
  self.cube[-1][1][1] = appoggio
  --permutazione spigoli
  appoggio = self.cube[0][1][1]
  self.cube[0][1][1] = self.cube[1][1][0]
  self.cube[1][1][0] = self.cube[0][1][-1]
  self.cube[0][1][-1] = self.cube[-1][1][0]
  self.cube[-1][1][0] = appoggio
  print("mossa")

end
function mosse.destraAntiOrario(cuboIniziale) --permutazione destra orario
  --permutazione angoli
  appoggio = cuboIniziale.cube[1][1][1]
  cuboIniziale.cube[1][1][1] = cuboIniziale.cube[-1][1][1]
  cuboIniziale.cube[-1][1][1] = cuboIniziale.cube[-1][1][-1]
  cuboIniziale.cube[-1][1][-1] = cuboIniziale.cube[1][1][-1]
  cuboIniziale.cube[1][1][-1] = appoggio
  --permutazione spigoli
  appoggio = cuboIniziale.cube[0][1][1]
  cuboIniziale.cube[0][1][1] = cuboIniziale.cube[-1][1][0]
  cuboIniziale.cube[-1][1][0] = cuboIniziale.cube[0][1][-1]
  cuboIniziale.cube[0][1][-1] = cuboIniziale.cube[1][1][0]
  cuboIniziale.cube[1][1][0] = appoggio
end
function mosse.sinistraOrario(cuboIniziale) --permutazione sinistra orario
  --permutazione angoli
  appoggio = cuboIniziale.cube[1][-1][1]
  cuboIniziale.cube[1][-1][1] = cuboIniziale.cube[-1][-1][1]
  cuboIniziale.cube[-1][-1][1] = cuboIniziale.cube[-1][-1][-1]
  cuboIniziale.cube[-1][-1][-1] = cuboIniziale.cube[1][-1][-1]
  cuboIniziale.cube[1][-1][-1] = appoggio
  --permutazione spigoli
  appoggio = cuboIniziale.cube[0][-1][1]
  cuboIniziale.cube[0][-1][1] = cuboIniziale.cube[-1][-1][0]
  cuboIniziale.cube[-1][-1][0] = cuboIniziale.cube[0][-1][-1]
  cuboIniziale.cube[0][-1][-1] = cuboIniziale.cube[1][-1][0]
  cuboIniziale.cube[1][-1][0] = appoggio
end
function mosse.sinistraAntiOrario(cuboIniziale) --permutazione sinistra orario
  --permutazione angoli
  appoggio = cuboIniziale.cube[1][-1][1]
  cuboIniziale.cube[1][-1][1] = cuboIniziale.cube[1][-1][-1]
  cuboIniziale.cube[1][-1][-1] = cuboIniziale.cube[-1][-1][-1]
  cuboIniziale.cube[-1][-1][-1] = cuboIniziale.cube[-1][-1][1]
  cuboIniziale.cube[-1][-1][1] = appoggio
  --permutazione spigoli
  appoggio = cuboIniziale.cube[0][-1][1]
  cuboIniziale.cube[0][-1][1] = cuboIniziale.cube[1][-1][0]
  cuboIniziale.cube[1][-1][0] = cuboIniziale.cube[0][-1][-1]
  cuboIniziale.cube[0][-1][-1] = cuboIniziale.cube[-1][-1][0]
  cuboIniziale.cube[-1][-1][0] = appoggio
end
function mosse.fronteOrario(cuboIniziale) --permutazione fronte orario
  --permutazione angoli
  appoggio = cuboIniziale.cube[1][1][1]
  cuboIniziale.cube[1][1][1] = cuboIniziale.cube[1][-1][1]
  cuboIniziale.cube[1][-1][1] = cuboIniziale.cube[1][-1][-1]
  cuboIniziale.cube[1][-1][-1] = cuboIniziale.cube[1][1][-1]
  cuboIniziale.cube[1][1][-1] = appoggio
  --permutazione spigoli
  appoggio = cuboIniziale.cube[1][0][1]
  cuboIniziale.cube[1][0][1] = cuboIniziale.cube[1][-1][0]
  cuboIniziale.cube[1][-1][0] = cuboIniziale.cube[1][0][-1]
  cuboIniziale.cube[1][0][-1] = cuboIniziale.cube[1][1][0]
  cuboIniziale.cube[1][1][0] = appoggio
end
function mosse.fronteAntiOrario(cuboIniziale) --permutazione fronte orario
  --permutazione angoli
  appoggio = cuboIniziale.cube[1][1][1]
  cuboIniziale.cube[1][1][1] = cuboIniziale.cube[1][1][-1]
  cuboIniziale.cube[1][1][-1] = cuboIniziale.cube[1][-1][-1]
  cuboIniziale.cube[1][-1][-1] = cuboIniziale.cube[1][-1][1]
  cuboIniziale.cube[1][-1][1] = appoggio
  --permutazione spigoli
  appoggio = cuboIniziale.cube[1][0][1]
  cuboIniziale.cube[1][0][1] = cuboIniziale.cube[1][1][0]
  cuboIniziale.cube[1][1][0] = cuboIniziale.cube[1][0][-1]
  cuboIniziale.cube[1][0][-1] = cuboIniziale.cube[1][-1][0]
  cuboIniziale.cube[1][-1][0] = appoggio
end
mosse.upAntiOrario = function(cuboIniziale)
  --Muovo gli angoli
  appoggio = cuboIniziale.cube[1][-1][1]
  cuboIniziale.cube[1][-1][1] = cuboIniziale.cube[-1][-1][1]
  cuboIniziale.cube[-1][-1][1] = cuboIniziale.cube[-1][1][1]
  cuboIniziale.cube[-1][1][1] = cuboIniziale.cube[1][1][1]
  cuboIniziale.cube[1][1][1] = appoggio
  --Muovo gli spigoli
  appoggio = cuboIniziale.cube[1][0][1]
  cuboIniziale.cube[1][0][1] = cuboIniziale.cube[0][-1][1]
  cuboIniziale.cube[0][-1][1] = cuboIniziale.cube[-1][0][1]
  cuboIniziale.cube[-1][0][1] = cuboIniziale.cube[0][1][1]
  cuboIniziale.cube[0][1][1] = appoggio
end
mosse.upOrario = function(cuboIniziale)
  --Muovo gli angoli
  appoggio = cuboIniziale.cube[1][-1][1]
  cuboIniziale.cube[1][-1][1] = cuboIniziale.cube[1][1][1]
  cuboIniziale.cube[1][1][1] = cuboIniziale.cube[-1][1][1]
  cuboIniziale.cube[-1][1][1] = cuboIniziale.cube[-1][-1][1]
  cuboIniziale.cube[-1][-1][1] = appoggio
  --Muovo gli spigoli
  appoggio = cuboIniziale.cube[1][0][1]
  cuboIniziale.cube[1][0][1] = cuboIniziale.cube[0][1][1]
  cuboIniziale.cube[0][1][1] = cuboIniziale.cube[-1][0][1]
  cuboIniziale.cube[-1][0][1] = cuboIniziale.cube[0][-1][1]
  cuboIniziale.cube[0][-1][1] = appoggio
end
mosse.downOrario = function(cuboIniziale)
  appoggio = cuboIniziale.cube[1][-1][-1]
  cuboIniziale.cube[1][-1][-1] = cuboIniziale.cube[-1][-1][-1]
  cuboIniziale.cube[-1][-1][-1] = cuboIniziale.cube[-1][1][-1]
  cuboIniziale.cube[-1][1][-1] = cuboIniziale.cube[1][1][-1]
  cuboIniziale.cube[1][1][-1] = appoggio

  appoggio = cuboIniziale.cube[1][0][-1]
  cuboIniziale.cube[1][0][-1] = cuboIniziale.cube[0][-1][-1]
  cuboIniziale.cube[0][-1][-1] = cuboIniziale.cube[-1][0][-1]
  cuboIniziale.cube[-1][0][-1] = cuboIniziale.cube[0][1][-1]
  cuboIniziale.cube[0][1][-1] = appoggio
end
mosse.downAntiOrario = function(cuboIniziale)
  appoggio = cuboIniziale.cube[1][-1][-1]
  cuboIniziale.cube[1][-1][-1] = cuboIniziale.cube[1][1][-1]
  cuboIniziale.cube[1][1][-1] = cuboIniziale.cube[-1][1][-1]
  cuboIniziale.cube[-1][1][-1] = cuboIniziale.cube[-1][-1][-1]
  cuboIniziale.cube[-1][-1][-1] = appoggio

  appoggio = cuboIniziale.cube[1][0][-1]
  cuboIniziale.cube[1][0][-1] = cuboIniziale.cube[0][1][-1]
  cuboIniziale.cube[0][1][-1] = cuboIniziale.cube[-1][0][-1]
  cuboIniziale.cube[-1][0][-1] = cuboIniziale.cube[0][-1][-1]
  cuboIniziale.cube[0][-1][-1] = appoggio
end
mosse.backOrario = function(cuboIniziale)
  appoggio = cuboIniziale.cube[-1][1][1]
  cuboIniziale.cube[-1][1][1] = cuboIniziale.cube[-1][1][-1]
  cuboIniziale.cube[-1][1][-1] = cuboIniziale.cube[-1][-1][-1]
  cuboIniziale.cube[-1][-1][-1] = cuboIniziale.cube[-1][-1][1]
  cuboIniziale.cube[-1][-1][1] = appoggio

  appoggio = cuboIniziale.cube[-1][0][1]
  cuboIniziale.cube[-1][0][1] = cuboIniziale.cube[-1][1][0]
  cuboIniziale.cube[-1][1][0] = cuboIniziale.cube[-1][0][-1]
  cuboIniziale.cube[-1][0][-1] = cuboIniziale.cube[-1][-1][0]
  cuboIniziale.cube[-1][-1][0] = appoggio
end
mosse.backAntiOrario = function(cuboIniziale)
  appoggio = cuboIniziale.cube[-1][1][1]
  cuboIniziale.cube[-1][1][1] = cuboIniziale.cube[-1][-1][1]
  cuboIniziale.cube[-1][-1][1] = cuboIniziale.cube[-1][-1][-1]
  cuboIniziale.cube[-1][-1][-1] = cuboIniziale.cube[-1][1][-1]
  cuboIniziale.cube[-1][-1][-1] = appoggio

  appoggio = cuboIniziale.cube[-1][0][1]
  cuboIniziale.cube[-1][0][1] = cuboIniziale.cube[-1][-1][0]
  cuboIniziale.cube[-1][-1][0] = cuboIniziale.cube[-1][0][-1]
  cuboIniziale.cube[-1][0][-1] = cuboIniziale.cube[-1][1][0]
  cuboIniziale.cube[-1][1][0] = appoggio
end

------------------------------------------------------------

-- FINE DESCRIZIONE MOSSE

-----------------------------------------------------------

-- euristica per calcolare la distanza
function manhattanDistance(Cube)
  sum = 0
  for i = -1, 1 do
    for j = -1, 1 do
      for k = -1, 1 do
      --  io.write(cuboIniziale.cube[i][j][k], "---------> ")
        x1 = findIndexX(Cube.cube[i][j][k],Cube)
        y1 = findIndexY(Cube.cube[i][j][k],Cube)
        z1 = findIndexZ(Cube.cube[i][j][k],Cube)
       -- io.write("[X1:", x1, " Y1:", y1, " Z1:", z1, "]")
        x2 = findIndexX(cuboFinale.cube[i][j][k],cuboFinale)
        y2 = findIndexY(cuboFinale.cube[i][j][k],cuboFinale)
        z2 = findIndexZ(cuboFinale.cube[i][j][k],cuboFinale)
    --    io.write("[X2:", x2, "Y2:", y2, "Z2:", z2, "]")
        -- print(x2)
        x = math.abs(x1 - x2)
        --math.abs(x)
        y = math.abs(y1 - y2)
        z = math.abs(z1 - z2)
        sum = sum + (x + y + z)
      --  io.write("X:", x, " Y:", y, " Z:", z)
       -- io.write(" somma ", sum, "\n")
      end
    end
  end
  return sum / 8
end

function printCube(Cube)
  print("  CUBO  ")
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        io.write("x:", i, "y:", j, "z:", z, " ------")
        print(Cube.cube[i][j][z])
      end
    end
  end
end

io.write("somma totale:  ", manhattanDistance(cuboIniziale),"\n")
--cuboIniziale.printCube(cuboFinale.cube)

---------------------------------------------------------------

-- A-STAR ALGORITHM

--riformulare l'algoritmo in modo che nodi e vicini siano le mosse e le configurazioni
---------------------------------------------------------------
----------------------------------------------------------------
-- local variables
----------------------------------------------------------------

local INF = 1 / 0
local cachedPaths = nil

----------------------------------------------------------------
-- local functions
----------------------------------------------------------------

function lowest_f_score(set, f_score)
  local lowest, bestConfiguration = INF, nil
  for  _, configuration in ipairs(set) do
    local score = f_score[configuration]
    if score < lowest then
      lowest, bestConfiguration = score, configuration
    end
  end
  return bestConfiguration
end



function not_in(set, cuboCorrente)
  for _, cubo in ipairs(set) do
    if control(cubo,cuboCorrente) then
      return false
    end
  end
  return true
end

function remove_cube(set, cuboCorrente)
  for i, cube in ipairs(set) do
    if cube == cuboCorrente then
      set[i] = set[#set]
      set[#set] = nil
      break
    end
  end
end

function unwind_path(flat_path, map, current_cube)
  if map[current_cube] then
    table.insert(flat_path, 1, map[current_cube])
    return unwind_path(flat_path, map, map[current_cube])
  else
    return flat_path
  end
end

----------------------------------------------------------------
-- pathfinding functions
----------------------------------------------------------------

function a_star(start, goal, moves)
  local closedset = {}
  local openset = {start}
  local came_from = {}
local moves=moves
  local g_score, f_score = {}, {}
  g_score[start] = 0
  f_score[start] = g_score[start] + manhattanDistance(start)
  print("passo effettuato")
  io.write("dimensione openset: ",#openset)
  while #openset > 0 do
    local current = lowest_f_score(openset, f_score)
    --printCube(current)
    --printCube(goal)
    if control(current,goal) then
      local path = unwind_path({}, came_from, goal)
      table.insert(path, goal)
      return path
    end

    remove_move(openset, current)
    table.insert(closedset, current)

    
    for _, move in ipairs(moves) do

      -- crea un nuovo cubo, fa la copia della configurazione iniziale ed esegue la mossa
  
      pippo=Cube:create()
      pippo.cube=start.cube
      move(pippo)
      if not_in(closedset, pippo) then
        local tentative_g_score = g_score[current]
        if not_in(openset, pippo) or tentative_g_score < g_score[pippo] then
          came_from[pippo] = current
          g_score[pippo] = tentative_g_score
          f_score[pippo] = g_score[pippo] + manhattanDistance(pippo)
          if not_in(openset, pippo) then
            table.insert(openset, pippo)
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

function clear_cached_paths()
  cachedPaths = nil
end

function path(start, goal, moves, ignore_cache)
  if not cachedPaths then
    cachedPaths = {}
  end
  if not cachedPaths[start] then
    cachedPaths[start] = {}
  elseif cachedPaths[start][goal] and not ignore_cache then
    return cachedPaths[start][goal]
  end

  local resPath = a_star(start, goal, moves)
  if not cachedPaths[start][goal] and not ignore_cache then
    cachedPaths[start][goal] = resPath
  end

  return resPath
end

printCube(cuboIniziale)
printCube(cuboFinale)
cuboIniziale:destraOrario()
--cuboFinale:mossaEsempio(mosse.destraOrario)
--mosse.destraOrario(cuboIniziale)
--mosse.sinistraAntiOrario(cuboIniziale)
printCube(cuboIniziale)
printCube(cuboFinale)
local path = path(cuboIniziale, cuboFinale, mosse, true)

if not path then
  print("No valid path found")
else
  for i, node in ipairs(path) do
    --printCube(node)
    print(i)
  end
end
