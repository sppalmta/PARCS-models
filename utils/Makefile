
FC = gfortran
FFLAGS = -O2 -fbacktrace -Wall -fbounds-check

.SUFFIXES :
.SUFFIXES : .f90 .o

default: readdpl.exe readt16.exe

readdpl.exe: readdpl.f90
	$(FC) $(FFLAGS) $^ -o $@
	ls -fl $@

readt16.exe: readt16.f90
	$(FC) $(FFLAGS) $^ -o $@
	ls -fl $@

.f90.o :
	$(FC) $(FFLAGS) -c $*.f90

clean:
	rm -f readdpl.exe readt16.exe *.mod *.o

