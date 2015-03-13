program EulerProblem12;

uses windows;

procedure findfactorlimit(seed, x : longint);

  function divides(n,d : longint):boolean;
  begin
    result := false;
    if d > 0 then
      result := n mod d = 0;
  end;

  function gettriangle(n : longint):longint;
  begin
    result := (n * (n + 1)) div 2;
  end;

  function numfactorsof(n : longint):longint;
  var count : longint;
      d : longint;
  begin
    count := 0;
    for d := 1 to trunc(sqrt(n)) do
    begin
      if divides(n,d) then
        inc(count,2);
    end;
    result := count;
  end;

var loop :longint;
    foundit : boolean;
    t : longint;
    nft : longint;
    starttime : longint;
    duration : longint;
begin
  starttime := GetTickCount;
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
    duration := GetTickCount - starttime;
    writeln(loop,' ',t,' ',nft,' ',x,' ',duration,' ms');
  end;
end;

begin
  findfactorlimit(1,500);
end.
