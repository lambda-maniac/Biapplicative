module Control.Biapplicative where

import Data.Bifunctor (Bifunctor, bimap)
import Data.Biapplicative (Biapplicative, (<**>))

($$) :: (a -> a -> b) -> a -> b
($$) f a = f a a
infixr 0 $$

(.:) :: (c -> d) -> (a -> b -> c) -> a -> b -> d
(.:) f g a b = f $ g a b
infixr 8 .:

(<$$>) :: Bifunctor f => (a -> c) -> (b -> d) -> f a b -> f c d
(<$$>) = bimap
infixl 3 <$$>

biop :: Biapplicative f => (a -> b -> c) -> f a a -> f b b -> f c c
biop = (<**>) .: ((<$$>) $$)
