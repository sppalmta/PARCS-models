!
      hst_opt        F F F F F   ! lhcr, lhdc, lhpc, lhtf, lhtc
      out_opt        F T T T F   ! ppow, phst, pths, pxesm, pkxs
!
!   *** deplete 12 time steps * 30 EFPD each.  approximate 18 month depletion
      time_stp       5.0 25.0 17*30.0   ! nuscale added more time steps 18 * 30 EFPD is about 1.5 years of operations
!
      pmaxs_f         1  '../xs_pwr/nuscale_265g0.pmax'      1
      pmaxs_f         2  '../xs_pwr/nuscale_400g0.pmax'      2
      pmaxs_f         3  '../xs_pwr/nuscale_450g0.pmax'      3
      pmaxs_f         4  '../xs_pwr/nuscale_450g08e6.pmax'   4
      pmaxs_f         5  '../xs_pwr/nuscale_450g08e6.pmax'   5
      pmaxs_f         6  '../xs_pwr/nuscale_500g0.pmax'      6
      pmaxs_f         7  '../xs_pwr/nuscale_500g0.pmax'      7
      pmaxs_f         8  '../xs_pwr/nuscale_500g0.pmax'      8
      pmaxs_f         9  '../xs_pwr/wb-refl_rad2_edge.PMAX'  9
      pmaxs_f        10  '../xs_pwr/wb-refl_rad2_edge.PMAX' 10
      pmaxs_f        11  '../xs_pwr/wb-refl_rad2_edge.PMAX' 11
      pmaxs_f        12  '../xs_pwr/wb-refl_rad2_edge.PMAX' 12
      pmaxs_f        13  '../xs_pwr/wb-refl_rad2_edge.PMAX' 13
      pmaxs_f        14  '../xs_pwr/wb-refl_rad2_edge.PMAX' 14
      pmaxs_f        15  '../xs_pwr/wb-refl_rad2_edge.PMAX' 15
      pmaxs_f        16  '../xs_pwr/wb-refl_rad2_edge.PMAX' 16
      pmaxs_f        17  '../xs_pwr/wb-refl_rad2_edge.PMAX' 17
      pmaxs_f        18  '../xs_pwr/wb-refl_rad2_edge.PMAX' 18
      pmaxs_f        19  '../xs_pwr/wb-refl_rad2_edge.PMAX' 19
      pmaxs_f        20  '../xs_pwr/wb-refl_rad2_edge.PMAX' 20
      pmaxs_f        21  '../xs_pwr/wb-refl_rad2_edge.PMAX' 21
      pmaxs_f        22  '../xs_pwr/wb-refl_bot.PMAX'       22
      pmaxs_f        23  '../xs_pwr/wb-refl_rad2_edge.PMAX' 23
      pmaxs_f        24  '../xs_pwr/wb-refl_top.PMAX'       24

