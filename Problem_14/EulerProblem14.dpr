program EulerProblem14;

{
The following iterative sequence is defined for the set of positive integers:

n --> n/2 (n is even)
n --> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 --> 40 --> 20 --> 10 --> 5 --> 16 --> 8 --> 4 --> 2 --> 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains
10 terms. Although it has not been proved yet (Collatz Problem), it is thought
that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
}
uses windows; // needed for GetTickCount

function GetCollatzValue(x : cardinal):cardinal;
begin
  if odd(x) then
    result := 3 * x + 1
  else
    result := x div 2;
end;

procedure FindLargestCollatzValueLessThan1Million;
var lHighestVal : cardinal;
    oLoop,
    iLoop        : cardinal;
    lCounter,
    lHighestCount : cardinal;
begin
  lHighestVal := 0;
  lHighestCount := 0;
  for oloop := 1000000 downto 1 do
  begin
    iLoop := oLoop;
    lCounter := 0;
    repeat
      inc(lCounter);
      iLoop := getCollatzValue(iLoop);
    until iLoop = 1;
    if lCounter > lHighestCount then
    begin
      lHighestCount := lCounter;
      lHighestVal := oLoop;
    end;
  end;
  writeln(lHighestVal,' ',lHighestCount);
end;

begin
  FindLargestCollatzValueLessThan1Million;
end.
