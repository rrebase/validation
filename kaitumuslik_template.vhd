entity  fsm  is
  port ( clk, x1, x2, x3: in bit;
         y1, y2, y3, y4: out bit );
end entity fsm;

architecture  bhv  of  fsm  is
  type state_type is (s1, s2, s3);
  signal state, next_state: state_type := s1;
begin  --  bhv
  -- Next state and output functions
  process (x1, x2, x3, state) begin
    case state is
    when s1 => if x1='0' then
        next_state<=s1;  y1<='1';  y2<='0';  y3<='1';  y4<='0';
      elsif x1='1' and x2='1' then
        next_state<=s2;  y1<='0';  y2<='1';  y3<='1';  y4<='0';
      else
        next_state<=s3;  y1<='1';  y2<='0';  y3<='0';  y4<='1';
      end if;
    when s2 => if x3='0' then
        next_state<=s2;  y1<='0';  y2<='1';  y3<='0';  y4<='1';
      else
        next_state<=s1;  y1<='1';  y2<='0';  y3<='1';  y4<='0';
      end if;
    when s3 =>
        next_state<=s1;  y1<='1';  y2<='0';  y3<='1';  y4<='0';
    end case;
  end process;

  -- State register
  process begin
    wait on clk until clk='1';
    state<=next_state;
  end process;
end architecture bhv;
