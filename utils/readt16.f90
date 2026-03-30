   program main
   implicit none
!=======================================================================
!
!  Program to read Polaris T16 file
!
!  @version CVS $Id: readt16.f90,v 1.2 2025/12/20 22:56:03 palmtag Exp $
!
!=======================================================================

      integer :: k
      integer :: ia
      integer :: icax=12   ! input unit

      character(len=100) :: fname

      ia=iargc()
      if (ia.eq.0) stop 'usage: readt16 [file]'

      do k=1, ia
        call getarg(k,fname)
        open (icax,file=fname,status='old')
        call readt16(icax, k)
        close (icax)
      enddo

      end

!=======================================================================
      subroutine readt16(icax, ifile)
      implicit none

      integer, intent(in) :: icax
      integer, intent(in) :: ifile

      logical :: ifref    ! reflector flag

      integer :: i, j, idep     ! loop counter

      integer :: ndep     ! number of depletion steps
      integer :: nbranch  ! number of branches per depletion

      real(8) :: segmac(7)
      real(8) :: segbor(2)   ! boron cross section
      real(8) :: segknu(2)   ! kappa/nu
      real(8) :: segadf(8)   !
      real(8) :: xnu1, xnu2, xkap1, xkap2
      real(8) :: x1, x2, x3, xk
      real(8) :: boron

      real(8) :: dd1, dd2, flux1, flux2
      real(8) :: sigtot, sigtr, sigfis, nufis1, nufis2, kapfis
      real(8) :: sigcap
      real(8) :: sigabs1, sigabs2
      real(8) :: scat11, scat12, scat21, scat22

      real(8), allocatable :: xexp(:)
      real(8), allocatable :: xkeff(:)

      character(len=100) :: line
      character(len=20)  :: simname

!--- Read dimensions

      ifref=.false.
      simname=' '

      read (icax,'(a)') line
      if (line(1:11).ne."' Record 1:") stop 'record 1 error'
      read (icax,'(a)') line

      read (icax,'(a)') line
      if (line(1:11).ne."' Record 2:") stop 'record 2 error'
      read (icax,*) ndep, nbranch
      read (icax,*)

      allocate (xkeff(ndep))
      allocate (xexp(ndep))
      xkeff=0.0d0
      xexp=-100.0d0

      read (icax,'(a)') line
      if (line(1:11).ne."' Record 3:") stop 'record 3 error'
      read (icax,'(a)') line
      if (line.ne."' Burnups") stop 'record burnups error'
      read (icax,*) (xexp(j),j=1,ndep)

!--- loop over states

      do idep=1, ndep

        ifref=.false.
        segmac=0.0d0
        segadf=0.0d0
        boron=-100.0d0   ! init
        xnu1 =  10.0d0
        xnu2 =  10.0d0


!--- find k-eff block

        do j=0, nbranch
          do
            read (icax,'(a)',end=900) line
            if (line.eq."' k-eff") then
              if (j.eq.0) then
                 dd1=0.0d0
                 dd2=0.0d0
                 flux1=0.0d0
                 flux2=0.0d0
                 read (icax,*) xkeff(idep)   ! only save main branch
                 do i=1, 8
                   read (icax,*)
                 enddo

                 sigcap=0.0d0
                 sigfis=0.0d0
                 read (icax,'(a)') line
!d               write (0,'(3a)') 'debug>',trim(line),'<'
                 if (line(1:20).ne."'  Energy group    1") stop 'read group 1'
                 read (icax,'(a)') line
                 if (line(1:9).ne."'   total") stop 'read total 1 error'
                 read (icax,*) sigtot, x1, x2, x3, sigcap   ! group 1
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*) sigfis, x1, sigtr, nufis1, kapfis
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*) xnu1, x1, dd1, flux1
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*)
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*)
                 read (icax,'(a)') line
                 if (line.ne."' ADFs") stop 'read adf error'
                 read (icax,*) segadf(1), segadf(2), segadf(3), segadf(4)
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*)
                 read (icax,'(a)') line
                 if (line(1:12).ne."' Scattering") stop 'read scattering error'
                 read (icax,*) scat11, scat12   ! 1 to 2
                 if (dd1-1.0d0/(3.0d0*sigtr).gt.0.0001d0)  stop 'diff1 error'
                 write (0,*) 'tot sum1', sigtot, sigtot-sigcap-sigfis-scat11-scat12
                 sigabs1=sigfis+sigcap

                 sigfis=0.0d0
                 sigcap=0.0d0
                 read (icax,'(a)') line
                 if (line(1:20).ne."'  Energy group    2") stop 'read group 2'
                 read (icax,'(a)') line
                 if (line(1:9).ne."'   total") stop 'read total 2 error'
                 read (icax,*) sigtot, x1, x2, x3, sigcap   ! group 2
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*) sigfis, x1, sigtr, nufis2, kapfis
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*) xnu2, x1, dd2, flux2
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*)
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*)
                 read (icax,'(a)') line
                 if (line.ne."' ADFs") stop 'read adf error'
                 read (icax,*) segadf(5), segadf(6), segadf(7), segadf(8)
                 read (icax,'(a)') line
                 if (line(1:1).ne."'") stop 'string error'
                 read (icax,*)
                 read (icax,'(a)') line
                 if (line(1:12).ne."' Scattering") stop 'read scattering error'
                 read (icax,*) scat21, scat22
                 if (dd2-1.0d0/(3.0d0*sigtr).gt.0.0001d0)  stop 'diff2 error'
                 write (0,*) 'tot sum2', sigtot, sigtot-sigcap-sigfis-scat21-scat22
                 sigabs2=sigfis+sigcap

                 segmac(1)=dd1
                 segmac(2)=dd2
                 segmac(3)=scat12 - scat21*flux2/flux1
                 segmac(4)=sigabs1
                 segmac(5)=sigabs2
                 segmac(6)=nufis1
                 segmac(7)=nufis2
          ! todo: need boron cross sections
          ! todo: need kappa/nu
          ! todo: add xenon micro?  what is right way to calc sigabs?

                 xk=(nufis1+nufis2*scat12/sigabs2)/(sigabs1+scat12)
                 write (*,*) idep, 'xkeff ', xkeff(idep)
                 write (*,*) idep, 'xcalc ',xk
                 xk=(segmac(6)+segmac(7)*segmac(3)/segmac(5))/(segmac(3)+segmac(4))
                 write (*,*) idep, 'xcalc ',xk
                 write (*,*) idep, 'flux2/flux1 ', flux2/flux1

              endif  ! j=0
              exit
            endif
          enddo
        enddo

      enddo   ! end of depletion points

  900 continue

!--- print final edits

      do j=1, ndep
        write (*,40) j, xexp(j), xkeff(j)
      enddo
   40 format (i5, f8.3, 2f14.10)

      return
      end subroutine readt16

