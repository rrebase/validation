------------------------------------------------------------------------
-- IAY0150 - Homework #1. Example task - #1, gates, optimized.
------------------------------------------------------------------------
-- (C) Peeter Ellervee - 2016 - Tallinn
------------------------------------------------------------------------
library IEEE; use IEEE.std_logic_1164.all;
entity f_system is
  port ( x1, x2, x3, x4: in std_logic;
         y1, y2, y3, y4: out std_logic );
end entity f_system;

library IEEE; use IEEE.std_logic_1164.all;
architecture opti of f_system is
  signal x1i, x2i, x3i, x4i: std_logic;
  signal t1, t2, t3, t4, t5, t6, t7, t8, t9: std_logic;
  signal t13, t78, t256: std_logic;
begin
  x1i <= not (x1);
  x2i <= not (x2);
  x3i <= not (x3);
  x4i <= not (x4);

  t1 <= x1 and x2i and x4;
  t2 <= t9 and x2 and x4i;
  t3 <= x1i and x2 and x3;
  t4 <= x1i and x3 and x4i;
  t5 <= x1 and x3 and x4i;
  t6 <= x2i and x3i and x4;
  t7 <= x1 and x2 and x4;
  t8 <= x1 and x2i and x3i;
  t9 <= x1i and x3i;

  t13 <= t1 or t3;
  t78 <= t7 or t8;
  t256 <= t2 or t5 or t6;

  y1 <= t256 or t78;
  y2 <= t256 or t3;
  y3 <= t78 or t2 or t4;
  y4 <= t13 or t4 or t9;
end architecture opti;
