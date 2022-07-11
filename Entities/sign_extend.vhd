library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

--Used to use the formats
entity sign_extend is
  port (
    sign_extend_in    : in std_logic_vector (15 downto 0); -- (16-bit immediate field)
    sign_extend_func  : in std_logic_vector (1 downto 0);  -- func
    sign_extend_out   : out std_logic_vector (31 downto 0)
  ) ;
end sign_extend;

architecture arch_sign of sign_extend is 
begin

process(sign_extend_func)
begin 

case(sign_extend_func) is 

when "00" => sign_extend_out <= sign_extend_in & "0000000000000000"; --lui

when "01" => sign_extend_out(15 downto 0) <= sign_extend_in;  -- sli
             sign_extend_out(31 downto 16) <= (others => sign_extend_in(15));

when "10" => sign_extend_out(15 downto 0)  <= sign_extend_in; -- Arithmetic
             sign_extend_out(31 downto 16) <= (others => sign_extend_in(15)); 

when others => sign_extend_out <= "0000000000000000" & sign_extend_in; --logical

end case;
 end process;


end arch_sign;
