library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity somador1bit is
  port (
    a, b, cin: in std_logic;
    s, cout: out std_logic
  ) ;
end somador1bit ; 

architecture comuta of somador1bit is

    begin
        s <= (a xor b) xor cin;
        cout <= (a and b) or 
                (a and cin) or
                (b and cin);
end architecture ;