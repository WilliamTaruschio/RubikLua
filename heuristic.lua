--[[
rappresentazione del cubo tramite una matrice 3x3x3
tramite assi cartesiani x,y,z con valore ammessi -1,0,1
lista 
]] --

Cube = {}
function Cube:create(cube)
  -- creazione nuova tabella
  -- se non ne viene fornita una
  self.cube = cube or {}
  setmetatable(self.cube, self)
  self.__index = self
  -- body
  return self.cube
end

cuboIniziale = Cube:create()
cuboFinale = Cube:create()

function Cube:initialize()
  for i = -1, 1, 1 do
    self[i] = {} -- create a new row
    for j = -1, 1, 1 do
      self[i][j] = {}
      for k = -1, 1, 1 do
        self[i][j][k] = {}
      end
    end
  end
end
cuboIniziale:initialize()
cuboFinale:initialize()

function Cube:replace(cube)
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        self[i][j][z] = cube[i][j][z]
      end
    end
  end
  return self
end
----------------------------------------------------------
-- CUBO NORMALE IN CUI SI EFFETTUANO LE OPERAZIONI
----------------------------------------------------------

-- definizione cuboInizialetti, associazione coordinate-etichetta
cuboIniziale[-1][-1][-1] = "WGR"
cuboIniziale[-1][-1][0] = "GR"
cuboIniziale[-1][-1][1] = "YGR"
cuboIniziale[-1][0][-1] = "WR"
cuboIniziale[-1][0][0] = "0"
cuboIniziale[-1][0][1] = "YR"
cuboIniziale[-1][1][-1] = "WBR"
cuboIniziale[-1][1][0] = "BR"
cuboIniziale[-1][1][1] = "YRB"

cuboIniziale[0][-1][-1] = "WG"
cuboIniziale[0][-1][0] = "0"
cuboIniziale[0][-1][1] = "YG"
cuboIniziale[0][0][-1] = "0"
cuboIniziale[0][0][0] = "0"
cuboIniziale[0][0][1] = "0"
cuboIniziale[0][1][-1] = "WB"
cuboIniziale[0][1][0] = "0"
cuboIniziale[0][1][1] = "YB"

cuboIniziale[1][-1][-1] = "WOG"
cuboIniziale[1][-1][0] = "GO"
cuboIniziale[1][-1][1] = "YGO"
cuboIniziale[1][0][-1] = "WO"
cuboIniziale[1][0][0] = "0"
cuboIniziale[1][0][1] = "YO"
cuboIniziale[1][1][-1] = "WBO"
cuboIniziale[1][1][0] = "BO"
cuboIniziale[1][1][1] = "YBO"

--Genero il cubo per il confronto

----------------------------------------------------------
-- CUBO NELLA CONFIGURAZIONE FINALE
----------------------------------------------------------

cuboFinale[-1][-1][-1] = "WGR"
cuboFinale[-1][-1][0] = "GR"
cuboFinale[-1][-1][1] = "YGR"
cuboFinale[-1][0][-1] = "WR"
cuboFinale[-1][0][0] = "0"
cuboFinale[-1][0][1] = "YR"
cuboFinale[-1][1][-1] = "WBR"
cuboFinale[-1][1][0] = "BR"
cuboFinale[-1][1][1] = "YRB"

cuboFinale[0][-1][-1] = "WG"
cuboFinale[0][-1][0] = "0"
cuboFinale[0][-1][1] = "YG"
cuboFinale[0][0][-1] = "0"
cuboFinale[0][0][0] = "0"
cuboFinale[0][0][1] = "0"
cuboFinale[0][1][-1] = "WB"
cuboFinale[0][1][0] = "0"
cuboFinale[0][1][1] = "YB"

cuboFinale[1][-1][-1] = "WOG"
cuboFinale[1][-1][0] = "GO"
cuboFinale[1][-1][1] = "YGO"
cuboFinale[1][0][-1] = "WO"
cuboFinale[1][0][0] = "0"
cuboFinale[1][0][1] = "YO"
cuboFinale[1][1][-1] = "WBO"
cuboFinale[1][1][0] = "BO"
cuboFinale[1][1][1] = "YBO"

----------------------------------------------------
-- CONTROLLA I DUE CUBI
----------------------------------------------------

function Cube:cubeControl()
  for i = -1, 1 do
    ok = true
    for j = -1, 1 do
      for z = -1, 1 do
        if (cuboIniziale[i][j][z] ~= cuboFinale[i][j][z]) then
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
        if (cubo1[i][j][z] ~= cubo2[i][j][z]) then
          ok = false
        end
      end
    end
  end
  return ok
end
--print(cuboInizialeControl())

-------------------------------------------------------
--Metodi per trovare gli indici X Y Z
--------------------------------------------------------

function Cube:findIndexX(nome)
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        if (self[i][j][z] == nome) then
          return i
        end
      end
    end
  end
end
function Cube:findIndexY(nome)
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        if (self[i][j][z] == nome) then
          return j
        end
      end
    end
  end
end
function Cube:findIndexZ(nome)
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        if (self[i][j][z] == nome) then
          return z
        end
      end
    end
  end
end

------------------------------------------------------------

-- INIZIO DESCRIZIONE MOSSE

-----------------------------------------------------------

function Cube:mosse()
  local cubi = {}
  for i = 1, 12 do
    cubi[i] = Cube:create()
    cubi[i]:initialize()
    cubi[i]:replace(self)
  end

  cubi[1]:destraOrario()

  cubi[2]:destraAntiOrario()

  cubi[3]:sinistraOrario()

  cubi[4]:sinistraAntiOrario()

  cubi[5]:fronteOrario()

  cubi[6]:fronteAntiOrario()

  cubi[7]:downOrario()

  cubi[8]:downAntiOrario()

  cubi[9]:backOrario()

  cubi[10]:backAntiOrario()

  cubi[11]:upOrario()

  cubi[12]:upAntiOrario()

  return cubi
end

function Cube:destraOrario() --permutazione destra orario
  --permutazione angoli
  appoggio = self[1][1][1]
  self[1][1][1] = self[1][1][-1]
  self[1][1][-1] = self[-1][1][-1]
  self[-1][1][-1] = self[-1][1][1]
  self[-1][1][1] = appoggio
  --permutazione spigoli
  appoggio = self[0][1][1]
  self[0][1][1] = self[1][1][0]
  self[1][1][0] = self[0][1][-1]
  self[0][1][-1] = self[-1][1][0]
  self[-1][1][0] = appoggio
  return self
end

function Cube:destraAntiOrario() --permutazione  orariodestra
  --permutazione angoli
  appoggio = self[1][1][1]
  self[1][1][1] = self[-1][1][1]
  self[-1][1][1] = self[-1][1][-1]
  self[-1][1][-1] = self[1][1][-1]
  self[1][1][-1] = appoggio
  --permutazione spigoli
  appoggio = self[0][1][1]
  self[0][1][1] = self[-1][1][0]
  self[-1][1][0] = self[0][1][-1]
  self[0][1][-1] = self[1][1][0]
  self[1][1][0] = appoggio
  return self
end
function Cube:sinistraOrario() --permutazione sinistra orario
  --permutazione angoli
  appoggio = self[1][-1][1]
  self[1][-1][1] = self[-1][-1][1]
  self[-1][-1][1] = self[-1][-1][-1]
  self[-1][-1][-1] = self[1][-1][-1]
  self[1][-1][-1] = appoggio
  --permutazione spigoli
  appoggio = self[0][-1][1]
  self[0][-1][1] = self[-1][-1][0]
  self[-1][-1][0] = self[0][-1][-1]
  self[0][-1][-1] = self[1][-1][0]
  self[1][-1][0] = appoggio
  return self
end
function Cube:sinistraAntiOrario() --permutazione sinistra orario
  --permutazione angoli
  appoggio = self[1][-1][1]
  self[1][-1][1] = self[1][-1][-1]
  self[1][-1][-1] = self[-1][-1][-1]
  self[-1][-1][-1] = self[-1][-1][1]
  self[-1][-1][1] = appoggio
  --permutazione spigoli
  appoggio = self[0][-1][1]
  self[0][-1][1] = self[1][-1][0]
  self[1][-1][0] = self[0][-1][-1]
  self[0][-1][-1] = self[-1][-1][0]
  self[-1][-1][0] = appoggio
  return self
end
function Cube:fronteOrario() --permutazione fronte orario
  --permutazione angoli
  appoggio = self[1][1][1]
  self[1][1][1] = self[1][-1][1]
  self[1][-1][1] = self[1][-1][-1]
  self[1][-1][-1] = self[1][1][-1]
  self[1][1][-1] = appoggio
  --permutazione spigoli
  appoggio = self[1][0][1]
  self[1][0][1] = self[1][-1][0]
  self[1][-1][0] = self[1][0][-1]
  self[1][0][-1] = self[1][1][0]
  self[1][1][0] = appoggio
  return self
end
function Cube:fronteAntiOrario() --permutazione fronte orario
  --permutazione angoli
  appoggio = self[1][1][1]
  self[1][1][1] = self[1][1][-1]
  self[1][1][-1] = self[1][-1][-1]
  self[1][-1][-1] = self[1][-1][1]
  self[1][-1][1] = appoggio
  --permutazione spigoli
  appoggio = self[1][0][1]
  self[1][0][1] = self[1][1][0]
  self[1][1][0] = self[1][0][-1]
  self[1][0][-1] = self[1][-1][0]
  self[1][-1][0] = appoggio
  return self
end
function Cube:upAntiOrario()
  --Muovo gli angoli
  appoggio = self[1][-1][1]
  self[1][-1][1] = self[-1][-1][1]
  self[-1][-1][1] = self[-1][1][1]
  self[-1][1][1] = self[1][1][1]
  self[1][1][1] = appoggio
  --Muovo gli spigoli
  appoggio = self[1][0][1]
  self[1][0][1] = self[0][-1][1]
  self[0][-1][1] = self[-1][0][1]
  self[-1][0][1] = self[0][1][1]
  self[0][1][1] = appoggio
  return self
end
function Cube:upOrario()
  --Muovo gli angoli
  appoggio = self[1][-1][1]
  self[1][-1][1] = self[1][1][1]
  self[1][1][1] = self[-1][1][1]
  self[-1][1][1] = self[-1][-1][1]
  self[-1][-1][1] = appoggio
  --Muovo gli spigoli
  appoggio = self[1][0][1]
  self[1][0][1] = self[0][1][1]
  self[0][1][1] = self[-1][0][1]
  self[-1][0][1] = self[0][-1][1]
  self[0][-1][1] = appoggio
  return self
end
function Cube:downOrario()
  appoggio = self[1][-1][-1]
  self[1][-1][-1] = self[-1][-1][-1]
  self[-1][-1][-1] = self[-1][1][-1]
  self[-1][1][-1] = self[1][1][-1]
  self[1][1][-1] = appoggio

  appoggio = self[1][0][-1]
  self[1][0][-1] = self[0][-1][-1]
  self[0][-1][-1] = self[-1][0][-1]
  self[-1][0][-1] = self[0][1][-1]
  self[0][1][-1] = appoggio
  return self
end
function Cube:downAntiOrario()
  appoggio = self[1][-1][-1]
  self[1][-1][-1] = self[1][1][-1]
  self[1][1][-1] = self[-1][1][-1]
  self[-1][1][-1] = self[-1][-1][-1]
  self[-1][-1][-1] = appoggio

  appoggio = self[1][0][-1]
  self[1][0][-1] = self[0][1][-1]
  self[0][1][-1] = self[-1][0][-1]
  self[-1][0][-1] = self[0][-1][-1]
  self[0][-1][-1] = appoggio
  return self
end
function Cube:backOrario()
  appoggio = self[-1][1][1]
  self[-1][1][1] = self[-1][1][-1]
  self[-1][1][-1] = self[-1][-1][-1]
  self[-1][-1][-1] = self[-1][-1][1]
  self[-1][-1][1] = appoggio

  appoggio = self[-1][0][1]
  self[-1][0][1] = self[-1][1][0]
  self[-1][1][0] = self[-1][0][-1]
  self[-1][0][-1] = self[-1][-1][0]
  self[-1][-1][0] = appoggio
  return self
end
function Cube:backAntiOrario()
  appoggio = self[-1][1][1]
  self[-1][1][1] = self[-1][-1][1]
  self[-1][-1][1] = self[-1][-1][-1]
  self[-1][-1][-1] = self[-1][1][-1]
  self[-1][-1][-1] = appoggio

  appoggio = self[-1][0][1]
  self[-1][0][1] = self[-1][-1][0]
  self[-1][-1][0] = self[-1][0][-1]
  self[-1][0][-1] = self[-1][1][0]
  self[-1][1][0] = appoggio
  return self
end

------------------------------------------------------------

-- FINE DESCRIZIONE MOSSE

-----------------------------------------------------------

-- euristica per calcolare la distanza
function Cube:manhattanDistance()
  sum = 0
   for i = -1, 1 do
    for j = -1, 1 do
      for k = -1, 1 do
      
        local x1 = self:findIndexX(self[i][j][k])
        local y1 = self:findIndexY(self[i][j][k])
       local  z1 = self:findIndexZ(self[i][j][k])
        
        local x2 = cuboFinale:findIndexX(self[i][j][k])
        local y2 = cuboFinale:findIndexY(self[i][j][k])
        local z2 = cuboFinale:findIndexZ(self[i][j][k])
       
        
        x = math.abs(x1 - x2)
        
        y = math.abs(y1 - y2)
        z = math.abs(z1 - z2)
        sum = sum + (x + y + z)
        
      end
    end
  end
  print(sum/8.0)
  return sum / 8.0
end

function printCube(Cube)
  print("  CUBO  ")
  for i = -1, 1 do
    for j = -1, 1 do
      for z = -1, 1 do
        io.write("x:", i, "y:", j, "z:", z, " ------")
        print(Cube[i][j][z])
      end
    end
  end
end

--io.write("somma totale:  ", manhattanDistance(cuboIniziale),"\n")
--cuboIniziale.printCube(cuboFinale)

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
  for _, configuration in ipairs(set) do
    local score = f_score[configuration]
    if score < lowest then
      lowest, bestConfiguration = score, configuration
    end
  end
  return bestConfiguration
end

function not_in(set, cuboCorrente)
  for _, cubo in ipairs(set) do
    if control(cubo, cuboCorrente) then
      return false
    end
  end
  return true
end

function remove_cube(set, cuboCorrente)
  for i, cubo in ipairs(set) do
    if control(cubo, cuboCorrente) then
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

function a_star(start, goal)
  local percorso={}
   local tabellaAlbero={}
  local closedset = {}
  local openset = {start}
  local came_from = {}
  count = 0
  local g_score, f_score = {}, {}
  g_score[start] = 0
  f_score[start] = g_score[start] + start:manhattanDistance()
tabellaAlbero[start]=0
  
  while #openset > 0 do

    local current = lowest_f_score(openset, f_score)
    table.insert( percorso,current )
    
    if control(current, goal) then
     
      local path = unwind_path({}, came_from, goal)
      table.insert(path, goal)
      
      for _, occorrenza in ipairs(percorso) do
      io.write("indice:  ",tabellaAlbero[occorrenza],"  punteggio:  ",f_score[occorrenza],"\n")
    
      end
      return path
    end

    remove_cube(openset, current)
    table.insert(closedset, current)
    local cubi=current:mosse()
    for _, cubo in ipairs(cubi) do
      count=count+1
      -- crea un nuovo cubo, fa la copia della configurazione iniziale ed esegue la mossa
      tabellaAlbero[cubo]=count
      if not_in(closedset, cubo) then
        local tentative_g_score = g_score[current] 
        if not_in(openset, cubo)  then
          came_from[cubo] = current
          g_score[cubo] = tentative_g_score +1 
          f_score[cubo] = g_score[cubo] + cubo:manhattanDistance()
         --print(f_score[cubo])
          if not_in(openset, cubo) then
            table.insert(openset, cubo)
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

--printCube(cuboIniziale)
--printCube(cuboFinale)
cuboIniziale:destraOrario()

--cuboIniziale:sinistraOrario()
local path = path(cuboIniziale, cuboFinale, true)


if not path then
  print("No valid path found")
else
  for i, node in ipairs(path) do
   printCube(node)
  end
end
