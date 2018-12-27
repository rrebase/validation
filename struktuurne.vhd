entity  fsm  is
  port ( clk, x1, x2, x3: in bit;
         y1, y2, y3, y4: out bit );
end entity fsm;

architecture  str  of  fsm  is
  signal q1, q1i, q2, q2i, d1, d2, d2i: bit;
  signal t1, t2, y1b: bit;
  component d_ff
    port ( clk, d: in bit;
           q, not_q: out bit );
    end component;
begin  --  bhv
  -- Next state and output functions
  t1 <= not(x2 or q2);
  t2 <= not(not(not(x1 or q1i) or not(not(x2) or q2)));
  d1 <= not(not(t1 or t2));
  d2 <= t2;
  y1 <= y1b; y1b <= t1;
  y2 <= not y1b;
  y3 <= y1b;
  y4 <= not y1b;

  FF1: d_ff port map (clk, d1, q1, q1i);
  FF2: d_ff port map (clk, d2, q2, q2i);
end architecture str;
