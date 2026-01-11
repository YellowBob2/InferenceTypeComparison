-- === Haskell Type Inference Examples ===

-- === 1. Inférence de type de base ===
-- Aucune annotation de type requise, Haskell déduit les types

add x y = x + y  -- infére:     add :: Num a => a -> a -> a

example1 :: IO ()
example1 = do
    putStrLn "\n=== 1. TYPE INFERENCE (Hindley-Milner) ==="
    print (add 1 2)           -- 3
    print (add 1.2 3.4)       -- 4.6
    print (add 5 0.5)         -- 5.5   -   5 inférée comme Double pour éviter erreur
    let a = 5
    let b = 5.5
    print (add a b)           -- 10.5  -   a inférée comme Double pour éviter erreur

    -- types mixtes ne sont pas autorisés
    let c :: Int
        c = 5
    let d :: Double
        d = 5.5
    print (add 0 d)