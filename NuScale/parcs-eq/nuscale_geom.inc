!******************************************************************************
! GEOM include file

! NuScale core size is 9 across - 7 fuel assemblies plus 2 reflectors
! keeping axial size at 22, but needs to be decreased

      geo_dim        9 9 22  1  1   !nasyx,nasyy,nz
      rad_conf
       0  0 22 22 22 22 22  0  0
       0 22 22  4  3  4 22 22  0
      22 22  3  4  3  4  3 22 22
      22  4  4  4  4  4  4  4 22
      22  3  3  4  1  4  3  3 22
      22  4  4  4  4  4  4  4 22
      22 22  3  4  3  4  3 22 22
       0 22 22  4  3  4 22 22  0
       0  0 22 22 22 22 22  0  0

  ! 200 cm total fuel height = 20 nodes x 10cm each + axial reflector nodes

      assy_type      1  1*22 20*1  1*24 FUEL
      assy_type      2  1*22 20*2  1*24 FUEL
      assy_type      3  1*22 20*3  1*24 FUEL
      assy_type      4  1*22 20*4  1*24 FUEL
      assy_type      5  1*22 20*5  1*24 FUEL
      assy_type      6  1*22 20*6  1*24 FUEL
      assy_type      7  1*22 20*7  1*24 FUEL
      assy_type      8  1*22 20*8  1*24 FUEL
      assy_type      9  1*22 20*9  1*24 FUEL
      assy_type     10  1*22 20*10 1*24 FUEL
      assy_type     11  1*22 20*11 1*24 FUEL
      assy_type     12  1*22 20*12 1*24 FUEL
      assy_type     13  1*22 20*13 1*24 FUEL
      assy_type     14  1*22 20*14 1*24 FUEL
      assy_type     15  1*22 20*15 1*24 FUEL
      assy_type     16  1*22 20*16 1*24 FUEL
      assy_type     17  1*22 20*17 1*24 FUEL
      assy_type     18  1*22 20*18 1*24 FUEL
      assy_type     19  1*22 20*19 1*24 FUEL
      assy_type     20  1*22 20*20 1*24 FUEL
      assy_type     21  1*22 20*21 1*24 FUEL
      assy_type     22  1*22 20*23 1*24 REFL

!******************************************************************************
