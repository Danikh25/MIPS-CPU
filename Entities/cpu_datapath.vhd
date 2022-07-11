library ieee;
use ieee.std_logic_1164.all;

entity datapath is
  port ( clk, reset, reg_dst, reg_write, alu_src, add_sub, data_write, reg_in_src  : in std_logic ; 
  			pc_sel, branch_type, logic_func, func : in std_logic_vector (1 downto 0) ; 
  		   zero   : out std_logic ; 
           overflow  : out std_logic ; 
           op          : out std_logic_vector(5 downto 0);
           fn          : out std_logic_vector(5 downto 0)  ;
          rs_out, rt_out     : out std_logic_vector(3 downto 0)
          
          );
       
end datapath;


architecture dp_arch of datapath is

-----------------------------------------------

------COMPONENTS------------------

------------------------------------------------



component alu 
 port ( 	x, y : in std_logic_vector (31 downto 0);
			add_sub : in std_logic; 
			logic_func : in std_logic_vector (1 downto 0); 
			func : in std_logic_vector (1 downto 0);
			output : out std_logic_vector (31 downto 0);
			overflow : out std_logic ;
			zero : out std_logic          
           );
end component; 

component next_address
 port ( 	rt, rs: in std_logic_vector (31 downto 0);
			pc: in std_logic_vector (31 downto 0);
			target_address : in std_logic_vector (25 downto 0); 
			branch_type : in std_logic_vector (1 downto 0);
			pc_sel : in std_logic_vector (1 downto 0);
			next_pc : out std_logic_vector (31 downto 0) 
		); 
end component; 

component regfile
 port ( 	din : in std_logic_vector(31 downto 0);
			reset : in std_logic;
			clk : in std_logic;
			write : in std_logic;
			read_a : in std_logic_vector(4 downto 0);
			read_b : in std_logic_vector(4 downto 0);
			write_address : in std_logic_vector(4 downto 0);
			out_a : out std_logic_vector(31 downto 0);
			out_b : out std_logic_vector(31 downto 0) 
		);
end component; 


component pc_register
 port ( 	clk  : in std_logic;
           reset : in std_logic;
           D      : in std_logic_vector(31 downto 0);
           Q     : out std_logic_vector(31 downto 0)
         );
end component; 

component icache
 port ( 	address  : in std_logic_vector(4 downto 0);
        	instruction : out std_logic_vector(31 downto 0)
       );
end component; 

component dcache
 port ( clk  : in std_logic;
          reset : in std_logic;
          data_write : in std_logic;
          d_in  : in std_logic_vector(31 downto 0);
          address  : in std_logic_vector(4 downto 0);
          d_out : out std_logic_vector(31 downto 0)
       );
end component; 

component sign_ext
 port ( func : in  std_logic_vector(1 downto 0);
           in_data : in std_logic_vector(15 downto 0);
           sign_ext_data : out std_logic_vector(31 downto 0)
          );
end component; 



       

-------------------------------------

----------SIGNALS--------------

-------------------------------------

signal rt, rs, pc, next_pc : std_logic_vector (31 downto 0);
signal target_address : std_logic_vector (25 downto 0);

signal branch_type_in, pc_sel_in :  std_logic_vector (1 downto 0);


signal instruction : std_logic_vector (31 downto 0);

signal rd : std_logic_vector (31 downto 0);

signal write_address :  std_logic_vector(4 downto 0);
signal out_a, out_b , alu_y_in :  std_logic_vector(31 downto 0);

signal din : std_logic_vector(31 downto 0);

signal add_sub_in : std_logic; 
signal logic_func_in :  std_logic_vector (1 downto 0); 
signal  func_in :  std_logic_vector (1 downto 0);

signal output , d_out :  std_logic_vector (31 downto 0);

signal overflow_in :  std_logic ;
signal zero_in :  std_logic ;

signal sign_ext_data :  std_logic_vector(31 downto 0);




----------------------------------------------


    begin
    
----------------------------

----PORT MAP 

----------------------------

      
next_address_i : next_address port map
 ( 	rt        => rt,
   rs        => rs,
    pc       => pc,
    target_address => target_address,
    branch_type => branch_type_in,
    pc_sel => pc_sel_in,
    next_pc => next_pc
     );
     
pc_register_i : pc_register port map 
( clk => clk,
    reset => reset,
    D =>  next_pc,
    Q => pc
    );
    
 icache_i : icache  port map
     ( 	address   => pc(4 downto 0),
        instruction => instruction
       );    
       
      op <= instruction(31 downto 26);
      rs <= x"000000" & "000" & instruction(25 downto 21);
      rt <= x"000000" & "000" & instruction(20 downto 16);
      rd <= x"000000" & "000" & instruction(15 downto 11);
     fn <= instruction(5 downto 0);      
     target_address <= instruction(25 downto 0); 
      rs_out <= rs(3 downto 0);
      rt_out   <= rt(3 downto 0); 
       
   --Multiplexer     
    write_address <= rt(4 downto 0) when reg_dst = '0' 
    					else rd(4 downto 0);
    
                             
    regfile_i : regfile port map   
      (	din  => din,
       reset => reset,
        clk  => clk,
        write  => reg_write,
       read_a => rs(4 downto 0),
      read_b  => rt(4 downto 0),
      write_address  => write_address,
       out_a =>  out_a,
      out_b => out_b
      );    
      
      ------Multiplexer     
     alu_y_in <= out_b when alu_src = '0' else 
                          sign_ext_data;
                                
      alu_i : alu   port map
        ( 	x  => out_a,
           y => alu_y_in,
			add_sub => add_sub_in, 
			logic_func => logic_func_in, 
			func => func_in,
			output => output,
			overflow => overflow_in,
			zero => zero_in          
            );
    
    dcache_i : dcache  port map 
      ( clk    => clk,
        reset => reset,
        data_write => data_write,
        d_in  => out_b,
        address  =>output(4 downto 0),
        d_out  => d_out
       );
       
       
       ------Multiplexer 
     din  <=  d_out when reg_in_src = '1' else    output ;       
       
       
       sign_ext_i : sign_ext  port map 
        ( 	func  => func_in ,
           in_data  => instruction(15 downto 0),
           sign_ext_data => sign_ext_data         
          );       
          
          
          
          

   
   end dp_arch;
