## Taken from:
## http://users.powernet.co.uk/kienzle/octave/matcompat/scripts/specfun/pol2cart.m

## Copyright (C) 2000  Kai Habel
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## -*- texinfo -*-
## @deftypefn {Function File} {} [@var{X},@var{Y}] = pol2cart (@var{Theta},@var{R})
## @deftypefnx {Function File} {} [@var{X},@var{Y},@var{Z}] = pol2cart (@var{Theta},@var{R},@var{Z})
## transforms polar or cylindrical to cartesian coordinates.
## @var{Theta},@var{R} (and @var{Z}) must be of same shape.
## @var{Theta} describes the angle relative to the x - axis.
## @var{R} is the distance to the z - axis (0,0,z).
## @end deftypefn
## @seealso{cart2pol,cart2sph,sph2cart}

## Author:	Kai Habel <kai.habel@gmx.de>

function [...] = pol2cart (Theta, R, Z)
  if (nargin == 2)

    ##
    ## polar to cartesian
    ##

    msg = sprintf ("[X, Y] = pol2cart (Theta, R)\
          Theta,R must be matrices of same size");
    if ( !(is_matrix (Theta) && is_matrix (R)) ) || ( size (Theta) != size (R) )
      usage (msg);
    endif

    X = cos (Theta) .* R;
    Y = sin (Theta) .* R;

    vr_val (X);
    vr_val (Y);

  elseif (nargin == 3)

    ##
    ## cylindrical to cartesian
    ##

    msg = sprintf ("[X,Y,Z]=pol2cart(Theta,R,Z)\
          Theta,R,Z must be matrices of same length");

    if !(is_matrix (Theta) && is_matrix (R) && is_matrix (Z))
      usage (msg);
    endif

    if ( (size (Theta) != size (R)) || (size (Theta) != size (Z)) )
      usage (msg);
    endif

    X = cos (Theta) .* R;
    Y = sin (Theta) .* R;
    vr_val (Theta);
    vr_val (R);
    vr_val (Z);

  else
    usage ("pol2cart(...) number of arguments must be 2 or 3");
  endif
endfunction
