library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity regfile_board is
port( din_in : in std_logic_vector(3 downto 0);
 reset : in std_logic;
 clk : in std_logic;
 write : in std_logic;
 read_a_in : in std_logic_vector(1 downto 0);
 read_b_in : in std_logic_vector(1 downto 0);
 write_address_in : in std_logic_vector(1 downto 0);
 out_a_out : out std_logic_vector(3 downto 0);
 out_b_out : out std_logic_vector(3 downto 0));

end regfile_board ;


architecture reg_arch of regfile_board is

--Using an array for the 32 bit registers
type reg_file is array (0 to 3) of std_logic_vector(3 downto 0);
signal reg_array : reg_file;

begin
process(read_a_in, read_b_in, reg_array)
begin

--read_a and read_b are used to determine which registers will be made available 
out_a_out <= reg_array(conv_integer(read_a_in));
out_b_out <= reg_array(conv_integer(read_b_in));
end process;

process(clk, reset)
begin
--Content of registers reset to 0
if reset = '1' then 
reg_array <= (others => (others => '0'));
--  with write = 1, and write_address specified one register will be chosen to write din into it 
elsif (clk'event and clk = '1') then
if write = '1' then 
reg_array(conv_integer(write_address_in)) <= din_in;
end if;
end if;
end process;

end reg_arch;
