entity  fsm  is
  port ( clk, x1, x2, x3: in bit;
         y1, y2, y3, y4: out bit );
end entity fsm;

architecture  str  of  fsm  is
  signal q1, q1i, q2, q2i, j1, k1, j2, k2: bit;
  signal x2i, x3i, t1, t2, t3, y2b, y4b: bit;
  component jk_ff
    port ( clk, j, k: in bit;
           q, not_q: out bit );
    end component;
begin  --  bhv
  -- Next state and output functions
  x2i <= not x2;
  x3i <= not x3;
  j1  <= x1 and x2i and q2i;
  k1  <= '1';
  j2  <= x1 and x2 and q1i;
  k2  <= x3;
  t1  <= x3i and q2;
  t2  <= j2 and q2i;
  t3  <= j1 and q1i;
  y1  <= not y2b;
  y2  <= y2b;    y2b <= t2 or t1;
  y3  <= not y4b;
  y4  <= y4b;    y4b <= t3 or t1;

  -- State register JK flip-flops
  FF1: jk_ff port map (clk, j1, k1, q1, q1i);
  FF2: jk_ff port map (clk, j2, k2, q2, q2i);
end architecture str;
