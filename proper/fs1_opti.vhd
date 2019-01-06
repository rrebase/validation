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
  signal x1i, x2i, t1i, t2i, t3x, t3i, t4i, t5i, t6: std_logic;
  signal t7, t8x, t8, t68i, t9i, t19, t197i: std_logic;
begin
  x1i <= not (x1 and x1);
  x2i <= not (x2 and x2);

  t1i <= t4i or x1 or x3;
  t2i <= not (x1 and x3 and x4);
  t3x <= not (x3 or x4);
  t3i <= not (x2  and t3x);
  t4i <= not (x2 and x4);
  t5i <= not (x2i and x3);
  t6 <= t7  and x3;
  t7 <= not (x1 or x4);
  t8x <= not (x2 or x4);
  t8 <= x1 and t8x;
  t68i <= not (t6 or t8);
  t9i <= not (x1 and x3);
  t19 <= not (t1i and t9i);
  t197i <= not (t19 or t7);

  y1 <= not (t197i and t3i);
  y2 <= not (t19 or t8);
  y3 <= not (t3i and t4i and t68i);
  y4 <= not (t2i and t5i and t68i);
end architecture opti;
