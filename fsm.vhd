-- fsm.vhd: Finite State Machine
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (STATE0, STATE1, STATE2, STATE3, STATE4, STATE5_1, 
                    STATE5_2, STATE6_1, STATE6_2, STATE7_1, STATE7_2, 
                    STATE8_1, STATE8_2, STATE9_1, STATE9_2, STATE10, 
                    WRONG_KEY, PRINT_OK, PRINT_BAD, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= STATE0;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is

   when STATE0 =>
      next_state <= STATE0;

      if (KEY(7) = '1') then
         next_state <= STATE1;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      end if;   
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE1 =>
      next_state <= STATE1;

      if (KEY(0) = '1') then
         next_state <= STATE2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE2 =>
      next_state <= STATE2;

      if (KEY(4) = '1') then
         next_state <= STATE3;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE3 =>
      next_state <= STATE3;

      if (KEY(6) = '1') then
         next_state <= STATE4;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
    -- - - - - - - - - - - - - - - - - - - - - - -
    when STATE4 =>
      next_state <= STATE4;

      if (KEY(7) = '1') then
         next_state <= STATE5_1;
      elsif (KEY(8) = '1') then
         next_state <= STATE5_2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
    when STATE5_1 =>
      next_state <= STATE5_1;

      if (KEY(1) = '1') then
         next_state <= STATE6_1;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
    when STATE5_2 =>
      next_state <= STATE5_2;

      if (KEY(1) = '1') then
         next_state <= STATE6_2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE6_1 =>
      next_state <= STATE6_1;

      if (KEY(6) = '1') then
         next_state <= STATE7_1;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE6_2 =>
      next_state <= STATE6_2;

      if (KEY(1) = '1') then
         next_state <= STATE7_2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE7_1 =>
      next_state <= STATE7_1;

      if (KEY(9) = '1') then
         next_state <= STATE8_1;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;

      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE7_2 =>
      next_state <= STATE7_2;

      if (KEY(2) = '1') then
         next_state <= STATE8_2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;

      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE8_1 =>
      next_state <= STATE8_1;

      if (KEY(0) = '1') then
         next_state <= STATE9_1;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;

      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE8_2 =>
      next_state <= STATE8_2;

      if (KEY(6) = '1') then
         next_state <= STATE9_2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;

      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE9_1 =>
      next_state <= STATE9_1;

      if (KEY(4) = '1') then
         next_state <= STATE10;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;

      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE9_2 =>
      next_state <= STATE9_2;

      if (KEY(9) = '1') then
         next_state <= STATE10;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;

      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when STATE10 =>
      next_state <= STATE10;

      if (KEY(15) = '1') then
         next_state <= PRINT_OK;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= WRONG_KEY;
      
      end if;   
   -- - - - - - - - - - - - - - - - - - - - - - -
   when WRONG_KEY =>
      next_state <= WRONG_KEY;

      if (KEY(15) = '1') then
         next_state <= PRINT_BAD;
      end if;  
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_OK =>
      next_state <= PRINT_OK;

      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_BAD =>
      next_state <= PRINT_BAD;

      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;

      if (KEY(15) = '1') then
         next_state <= STATE0; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= STATE0;

   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
      -- - - - - - - - - - - - - - - - - - - - - - -
      when PRINT_OK =>

         FSM_CNT_CE <= '1';
         FSM_MX_MEM <= '1';
         FSM_MX_LCD <= '1';
         FSM_LCD_WR <= '1';
         
      -- - - - - - - - - - - - - - - - - - - - - - -
      when PRINT_BAD =>

         FSM_CNT_CE <= '1';
         FSM_MX_LCD <= '1';
         FSM_LCD_WR <= '1';
      -- - - - - - - - - - - - - - - - - - - - - - -
      when FINISH =>

         if (KEY(15) = '1') then
            FSM_LCD_CLR <= '1';
         end if;
      -- - - - - - - - - - - - - - - - - - - - - - -
      when others =>

         if (KEY(15) = '1') then
            FSM_LCD_CLR <= '1';
         elsif (KEY(14 downto 0) /= "000000000000000") then
            FSM_LCD_WR <= '1';
         end if;
         
   end case;

end process output_logic;

end architecture behavioral;

