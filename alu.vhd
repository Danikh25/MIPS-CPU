library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity alu is
port(x, y : in std_logic_vector(31 downto 0); -- two input
add_sub : in std_logic; -- 0 for add , 1 for sub
logic_func : in std_logic_vector(1 downto 0); -- and, or, xor, nor
func : in std_logic_vector(1 downto 0); -- 00 = lui, 01=setless, 10= arith, 11 = logic
output : out std_logic_vector(31 downto 0);
overflow : out std_logic;
zero : out std_logic
);
end alu;

Architecture alu_arch of alu is 
signal add_sub_out , logic_func_out : std_logic_vector(31 downto 0);
begin
--Add/sub unit
process(x, y, add_sub)
begin

case add_sub is
when '0' => add_sub_out <= x + y;
when '1' => add_sub_out <= x - y;
when others => NULL;

end case;
end process;

--Logic unit
process(x, y, logic_func)
begin

case logic_func is 
when "00" => logic_func_out <= (x and y); 
when "01" => logic_func_out <= (x or y); 
when "10" => logic_func_out <= (x xor y); 
when "11" => logic_func_out <= (x nor y);
when others => NULL;

end case;
end process;

--MUX
process(add_sub_out, logic_func_out, func)
begin

case func is 
when "00" => output <= y; --used to implement the lui instruction
when "01" => 
if x < y then -- to check if the result is negative or positive
output <= (0 => '1' , others => '0');
else
output <= (0 => '0' , others => '0');
end if;
when "10" => output <=  add_sub_out;
when "11" => output <=  logic_func_out;
when others => NULL;

end case;
end process;

--Zer0 ( to indicate if the output is 0)
process(add_sub_out)
begin
if add_sub_out= 0 then 
zero <= '1';
else 
zero <= '0';
end if ;
end process;

--Overflow (Obtained by a truth table of x(31) and y(31) and the sign bit)
process(add_sub_out)
begin
case add_sub is
when '0' => 
if x(31) = '0' and y(31) = '0' and add_sub_out(31) = '1' then
overflow <= '1'; -- if addition of 2 pos number gives a negative number overflow occurs
elsif x(31) = '1' and y(31) = '1' and add_sub_out(31) = '0' then 
overflow <= '1'; -- if addition of two negative number gives pos overflow occurs
else 
overflow <= '0';
end if;

when '1' =>
if x(31) = '0' and y(31) = '1' and add_sub_out(31) = '1' then
overflow <= '1'; -- if subtraction of + and - number gives a negative number overflow occurs
elsif x(31) = '1' and y(31) = '0' and add_sub_out(31) = '0' then 
overflow <= '1';-- if subtraction of + and - number gives a positive number overflow occurs
else 
overflow <= '0';
end if;
when others => NULL;
end case;
end process;
end alu_arch;
