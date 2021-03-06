-- | A module for defining Arbitrary instances for testing various particles.
module Particle.Test.Space3DCartesian_arbitrary where

import Test.QuickCheck

import Mesh.SimpleCartesian
import Space.Space3DCartesian
import NormalizedValues
import RandomNumbers
import Data.Vector.V3
import Test.Numeric_arbitrary

import Control.Applicative

-- * Arbitrary instances for BasicParticle attributes.

instance Arbitrary Seed where
  arbitrary = Seed <$> arbitrary

instance Arbitrary CellIndex where
  arbitrary = CellIndex <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Cell where
  arbitrary = Local <$> arbitrary

instance Arbitrary Direction where
    arbitrary = direction
                <$> normalized_value
                <$> (generateNormalVector3 <$> arbitrary <*> arbitrary)

instance Arbitrary Position where
  arbitrary = Position <$> ( Vector3 <$> arbitrary <*> arbitrary <*> arbitrary )

instance Arbitrary Distance where
  arbitrary = Distance <$> abs <$> arbitrary

instance Arbitrary Time where
  arbitrary = Time <$> abs <$> arbitrary

-- Need > 0 for speed. TODO: Use Positive modifier
instance Arbitrary Speed where
  arbitrary = Speed <$> abs <$> (0.1+) <$> arbitrary
