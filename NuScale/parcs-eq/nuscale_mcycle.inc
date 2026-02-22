!****************************************************************************************
!  MCYCLE include file
!                         A     B     C     D     S
      bank_def   1     100.0 100.0 100.0  100.0 100.0

      cycle_def     1
      depl_step     5.0 25.0 17*30.0   ! 19 deltas
      power_lev     20*100.0
      bank_seq      20*1
!     flow_rate     20*85.963
      inlt_temp     20*522.6     ! inlet temp K  (TH block uses C)

      LOCATION    0
               0    0    0    0    0
          0    0    E-1  D-1  C-1  0    0
       0  0    F-2  E-2  D-2  C-2  B-2  0    0
       0  G-3  F-3  E-3  D-3  C-3  B-3  A-3  0
       0  G-4  F-4  E-4  D-4  C-4  B-4  A-4  0
       0  G-5  F-5  E-5  D-5  C-5  B-5  A-5  0
       0  0    F-6  E-6  D-6  C-6  B-6  0    0
          0    0    E-7  D-7  C-7  0    0
               0    0    0    0    0
!label:   G    F    E    D    C    B    A

   ! center bundle not shuffled

      SHUF_MAP   1   1      ! shuf index, shuf mode: 1-individual; 2-batch
              0    0    0    0    0
         0    0    C-6  -3   E-6  0    0
      0  0    A-4  -4   F-6  -4   D-7  0    0
      0  B-5  -4   G-5  A-5  E-1  -4   F-5  0
      0  -3   B-6  C-1  -1   E-7  F-2  -3   0
      0  B-3  -4   C-7  G-3  A-3  -4   F-3  0
      0  0    D-1  -4   B-2  -4   G-4  0    0
         0    0    C-2  -3   E-2  0    0
              0    0    0    0    0


      CYCLE_IND  1   1  1  ! cycle numbering, shuf ID, cycle ID; no shuffling, just run one long cycle

      CONV_EC    0.1   1  ! convergence criterion (GWD/T), max number of iteration; will terminate whichever criteria is met.

!***********************************************************************
