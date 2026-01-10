-- === Haskell Type Inference Examples ===
-- Haskell a une inférence de type très puissante (Hindley-Milner)

-- === 1. Inférence de type de base ===
-- Aucune annotation de type requise, Haskell déduit les types
add x y = x + y  -- Haskell déduit: add :: Num a => a -> a -> a

double x = x * 2  -- double :: Num a => a -> a

greet name = "Hello, " ++ name  -- greet :: [Char] -> [Char]

example1 :: IO ()
example1 = do
    putStrLn "\n=== 1. TYPE INFERENCE (Hindley-Milner) ==="
    print (add 5 3)           -- 8
    print (add 3.5 2.1)       -- 5.6
    print (double 10)         -- 20
    putStrLn (greet "Alice")  -- "Hello, Alice"

-- === 2. Classes de type (Typeclasses) ===
-- Les typeclasses définissent des comportements pour différents types

-- Typeclass simple
class Showable a where
    myShow :: a -> String

instance Showable Int where
    myShow x = "Integer: " ++ show x

instance Showable Bool where
    myShow True = "Boolean: True"
    myShow False = "Boolean: False"

instance Showable String where
    myShow s = "Text: " ++ s

example2 :: IO ()
example2 = do
    putStrLn "\n=== 2. TYPECLASSES (Ad-hoc Polymorphism) ==="
    putStrLn (myShow (42 :: Int))
    putStrLn (myShow (True :: Bool))
    putStrLn (myShow ("Hello" :: String))

-- === 3. Contraintes de type et polymorphisme ===
-- Les contraintes limitent le polymorphisme

compare_and_show :: (Ord a, Show a) => a -> a -> String
compare_and_show x y 
    | x > y = show x ++ " > " ++ show y
    | x < y = show x ++ " < " ++ show y
    | otherwise = show x ++ " == " ++ show y

example3 :: IO ()
example3 = do
    putStrLn "\n=== 3. TYPE CONSTRAINTS ==="
    putStrLn (compare_and_show 5 3)
    putStrLn (compare_and_show 2.5 4.5)
    putStrLn (compare_and_show "apple" "banana")

-- === 4. Types algébriques et pattern matching ===
data Shape = Circle Double | Rectangle Double Double | Triangle Double Double Double

area :: Shape -> Double
area (Circle r) = pi * r * r
area (Rectangle w h) = w * h
area (Triangle a b c) = 
    let s = (a + b + c) / 2
    in sqrt (s * (s - a) * (s - b) * (s - c))

instance Show Shape where
    show (Circle r) = "Circle with radius " ++ show r
    show (Rectangle w h) = "Rectangle " ++ show w ++ "x" ++ show h
    show (Triangle a b c) = "Triangle " ++ show a ++ ", " ++ show b ++ ", " ++ show c

example4 :: IO ()
example4 = do
    putStrLn "\n=== 4. ALGEBRAIC DATA TYPES ==="
    let shapes = [Circle 5, Rectangle 4 6, Triangle 3 4 5]
    mapM_ (\s -> putStrLn (show s ++ " -> Area: " ++ show (area s))) shapes

-- === 5. Fonctions d'ordre supérieur et inférence ===
-- map, filter, fold infèrent leurs types automatiquement
example5 :: IO ()
example5 = do
    putStrLn "\n=== 5. HIGHER-ORDER FUNCTIONS ==="
    
    -- map infère le type de la fonction appliquée
    print (map (*2) [1..5])        -- [2,4,6,8,10]
    print (map length ["aa", "bbb", "c"])  -- [2,3,1]
    
    -- filter infère aussi
    print (filter (>3) [1..6])     -- [4,5,6]
    
    -- fold
    print (foldl (+) 0 [1..5])     -- 15

-- === 6. Inférence avec let-binding ===
-- Les types sont déduits dans les expressions let
example6 :: IO ()
example6 = do
    putStrLn "\n=== 6. LET-BINDING TYPE INFERENCE ==="
    let x = 5
        y = 3.14
        z = x * 2
        result = z + y
    putStrLn ("x = " ++ show x ++ " (Int)")
    putStrLn ("y = " ++ show y ++ " (Double)")
    putStrLn ("result = " ++ show result ++ " (Num type)")

-- === 7. Type annotations explicites (optionnel) ===
-- On peut ajouter des annotations pour clarifier ou restreindre
addInts :: Int -> Int -> Int
addInts x y = x + y

addDoubles :: Double -> Double -> Double
addDoubles x y = x + y

example7 :: IO ()
example7 = do
    putStrLn "\n=== 7. EXPLICIT TYPE ANNOTATIONS ==="
    print (addInts 5 3)
    print (addDoubles 5.5 2.1)

main :: IO ()
main = do
    putStrLn "=== Haskell Type Inference Examples ==="
    
    example1
    example2
    example3
    example4
    example5
    example6
    example7
    
    putStrLn "\n=== Key Points ==="
    putStrLn "1. Hindley-Milner: Strong type inference, no types needed"
    putStrLn "2. Typeclasses: Polymorphism through constraints"
    putStrLn "3. Pattern matching: Exhaustive analysis with ADTs"
    putStrLn "4. No method overloading: Use typeclasses instead"
    putStrLn "5. Immutability: All data is immutable by default"
    putStrLn "6. No objects: Use records and typeclasses"
