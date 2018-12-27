entity  fsm_test  is
end entity fsm_test;

architecture  bench  of  fsm_test  is
  signal clk: bit := '1';
  signal x1, x2, x3, y1, y2, y3, y4: bit := '0';
  signal x: bit_vector(1 to 3);
  signal y: bit_vector(1 to 4);

  component fsm
    port (clk, x1, x2, x3: in bit;
         y1, y2, y3, y4: out bit );
  end component;
begin
  clk <= not clk after 50 ns;
  x <= x1 & x2 & x3;
  y <= y1 & y2 & y3 & y4;

  -- Test sequence
  process begin
    wait on clk until clk='0';
    x3<='0';  -- S1 -> S2
    wait on clk until clk='0';
    x2<='0';  -- S2 -> S1
    wait on clk until clk='0';
    x3<='1';  -- S1 -> S2
    wait on clk until clk='0';
    x2<='1';  -- S2 -> S3
    wait on clk until clk='0';
    x1<='1';  -- S3 -> S3
    wait on clk until clk='0';
    x1<='0';  -- S3 -> S1
  end process;

  F: fsm port map (clk, x1, x2, x3, y1, y2, y3, y4);

end architecture bench;
