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
  signal t1i, t2i, t3i, t4i, t5i, t6i, t7i, t8i, t9: std_logic;
  signal t13i, t78i, t256i: std_logic;
begin
  x1i <= not (x1 and x1);
  x2i <= not (x2 and x2);
  x3i <= not (x3 and x3);
  x4i <= not (x4 and x4);

  t1i <= not (x1 and x2i and x4);
  t2i <= not (t9 and x2 and x4i);
  t3i <= not (x1i and x2 and x3);
  t4i <= not (x1i and x3 and x4i);
  t5i <= not (x1 and x3 and x4i);
  t6i <= not (x2i and x3i and x4);
  t7i <= not (x1 and x2 and x4);
  t8i <= not (x1 and x2i and x3i);
  t9 <= x1i and x3i;

  t13i <= t1i and t3i;
  t78i <= t7i and t8i;
  t256i <= t2i and t5i and t6i;

  y1 <= not (t256i and t78i);
  y2 <= not (t256i and t3i);
  y3 <= not (t78i and t2i and t4i);
  y4 <= not (t13i and t4i) or t9;
end architecture opti;
