module Data.Biapplicative where

import Data.Bifunctor

class Bifunctor f => Biapplicative f where
    bipure :: a -> b -> f a b

    (<**>) :: f (a -> c) (b -> d) -> f a b -> f c d
    infixl 4 <**>

    {-# MINIMAL bipure, (<**>) #-}

instance Biapplicative (,) where
    bipure = (,)
    (<**>) (fa, fb) (a, b) = (fa a, fb b)

-- instance Biapplicative Either where
--     bipure _ = Right
--     (<**>) (Left  f) (Left  a) = Left  $ f a
--     (<**>) (Right f) (Right a) = Right $ f a
--     (<**>) (Right f) (Left  a) = absurd
--     (<**>) (Left  f) (Right a) = absurd
--     # Impossible implementation (?)
