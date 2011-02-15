-- SimpleDataTypes.hs
-- T. M. Kelley
-- Dec 08, 2010
-- (c) Copyright 2010 LANSLLC all rights reserved.

module DataTypes where

import Data.Map
import Numerical

-- FIX: these should be distinct types

-- NOTE: If the range of CellIdx values is contiguous, it is better to use Array here - it will use less space in
-- setting with lots of cells
type MomentumTally  = Map CellIdx Momentum
type EnergyTally    = Map CellIdx Energy

data EventCount = EventCount { n_scatter  :: !Int -- NOTE: Strict counters are always a good idea
                             , n_absorb   :: !Int
                             , n_transmit :: !Int
                             , n_reflect  :: !Int
                             , n_escape   :: !Int
                             , n_census   :: !Int
                             } deriving Show

-- all the random numbers to select an event. Idea was to limit how
-- far down IO intrudes into the code.
data EventSelectors = EventSelectors {
      d_sig_s     :: FP   -- sample distance to scatter
    , d_sig_a     :: FP   -- sample distance to absorb
    , sel_omega   :: FP   -- sample new direction cosine
    }



-- version
-- $Id$

-- End of file
