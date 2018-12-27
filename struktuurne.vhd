entity  fsm  is
  port ( clk, x1, x2, x3: in bit;
         y1, y2, y3, y4: out bit );
end entity fsm;

architecture  str  of  fsm  is
  signal q1, q1i, q2, q2i, d1, d2, d2i: bit;
  signal x1i, x2i, t1, t2, t3, t4, y3b: bit;
  component d_ff
    port ( clk, d: in bit;
           q, not_q: out bit );
    end component;
begin  --  bhv
  -- Next state and output functions
  y1  <= q2i;
  y2  <= q2;
  t1  <= not (q1i or q2);
  t2  <= not (q1 or q2i);
  y3  <= y3b;  y3b <= not (t1 or t2);
  y4  <= not y3b;
  x1i <= not x1;
  d1  <= not (x1i or q1 or q2);
  x2i <= not x2;
  t3  <= not (x1i or x2i or q1 or q2);
  t4  <= not (x3 or q2i);
  d2i <= not (t3 or t4);
  d2  <= not d2i

  t1 <= not(x2 or q2);
  t2 <= not(not(not(x1 or not q1) or not(not(x2) or q2)));
  d1 <= not(not(t1 or t2));
  d2 <= t2;
  y1 <= t1;
  y2 <= not y1;
  y3 <= y1;
  y4 <= not y1;

  FF1: d_ff port map (clk, d1, q1, q1i);
  FF2: d_ff port map (clk, d2, q2, q2i);
end architecture str;
