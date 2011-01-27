-- | A module for defining Arbitrary instances for testing various particles.
module Particle.Test.Arbitrary where

import Test.QuickCheck

import Particle.RandomParticle
import Mesh.SimpleCartesian
import Space3DCartesian
import RandomValues
import Data.Vector.V3

import Control.Applicative

-- * Arbitrary instances for RandomParticle attributes. These will go
-- into making random particles for QuickCheck tests.

instance Arbitrary Seed where
  arbitrary = Seed <$> arbitrary

instance Arbitrary CellIndex where
  arbitrary = CellIndex <$> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Cell where
  arbitrary = Local <$> arbitrary

instance Arbitrary Direction where
  arbitrary = randomDirection_compute <$> arbitrary <*> arbitrary

instance Arbitrary Position where
  arbitrary = Position <$> ( Vector3 <$> arbitrary <*> arbitrary <*> arbitrary )

instance Arbitrary Distance where
  arbitrary = Distance . (10*) <$> arbitrary

instance Arbitrary RandomParticle where
  arbitrary = createParticle
	      <$> arbitrary
	      <*> arbitrary
              <*> arbitrary
	      <*> arbitrary
	      <*> arbitrary
	      <*> arbitrary
