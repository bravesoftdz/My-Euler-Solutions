{====================================================================================================
  This program was originally written using delphi and was
  then loaded into an online Pascal IDE at http://www.tutorialspoint.com/compile_pascal_online.php
  This program runs in a little over 200 ms
 ====================================================================================================} 
program EulerProblem12;

uses sysutils; // needed for Time measurement functions

procedure findfactorlimit(seed, x : longint);

  function divides(n,d : longint):boolean;
  begin
    divides := false;
    if d > 0 then
      divides := n mod d = 0;
  end;

  function gettriangle(n : longint):longint;
  begin
    gettriangle := (n * (n + 1)) div 2;
  end;

  function numfactorsof(n : longint):longint;

    function isSquare(x : longint):boolean;
    begin
     isSquare := x = sqrt(x) * sqrt(x);
    end;

  var count : longint;
      d : longint;
  begin
    count := 0;
    for d := 1 to trunc(sqrt(n)) do
    begin
      if divides(n,d) then
        inc(count,2);
    end;
    if isSquare(n) then
      dec(count);
    numfactorsof := count;
  end;

var loop :longint;
    foundit : boolean;
    t : longint;
    nft : longint;
    starttime : TDateTime;
    duration : TDateTime;
    h,m,s,ms : word;
begin
  starttime := Time;
  loop := seed-1;
  foundit := false;
  repeat
    inc(loop);
    t := gettriangle(loop);
    nft := numfactorsof(t);
    foundit := nft >= x;
  until foundit;
  if foundit then
  begin
    duration := Time - starttime;
    DecodeTime(Duration,h,m,s,ms);
    writeln(loop,' ',t,' ',nft,' ',x,' ',ms,' ms');
  end;
end;

begin
  findfactorlimit(1,500);
end.
