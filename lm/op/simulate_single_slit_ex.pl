# The following six numbers are measured directly from Inkscape.

$wy = 248.918;
$sy = 60.091;

if (0) {
# the single slit of width w:
$wx0 = -208.256;
$wx1 = -201.136;

# the screen at the bottom of the page:
$sx0 = -180.727;
$sx1 = -173.167;
}

if (1) {
# the single slit of width w:
$wx0  = -208.256;
$wx1 = -202.336;

# the screen at the bottom of the page:
$sx0 = -184.891;
$sx1 = -177.331;
}

$wdx = $wx1-$wx0;
$sdx = $sx1-$sx0;

$nw = 9;
$ns = 11;

$pi = 3.14159265;

$l0 = 0;
for ($i=0; $i<$ns; $i++) {
  $sx = $sx0+$i*$sdx;
  $ax = 0;
  $ay = 0;
  for ($j=0; $j<$nw; $j++) {
    $wx = $wx0+$j*$wdx;
    $l = pythag($wx-$sx,$wy-$sy);
    if ($j==0) {$l0=$l}
    $p = ($l0-$l)/10.;
    $u = (sprintf "%5.2f",$p);
    print "$u ";
    $ax = $ax + cos(2.*$pi*$p);
    $ay = $ay + sin(2.*$pi*$p);
  }
  print "   ";
  $a = pythag($ax,$ay);
  $u = (sprintf "%4.2f",$a);
  print "$u ";
  $u = (sprintf "%4.2f",$a*$a);
  print "$u ";
  print "\n";
}

sub pythag {
  my $x = shift;
  my $y = shift;
  return sqrt($x*$x+$y*$y);
}
