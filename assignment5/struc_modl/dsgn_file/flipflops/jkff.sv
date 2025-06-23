`timescale 1ns/1ps

module jkff(
   input  clk,
   input  reset, 
   input  j,
   input  k,
   output q,
   output qb
   );
   
   wire   js;  
   wire   ks; 
   wire   cm ;  
   wire   cs;
   wire   j1;  
   wire   k1;  
   wire   jm;  
   wire   km; 
   
   
   and(j1, j, qb);
   and(k1, k, q); 
   
   and(jm , ~reset  , j1);
   or(km , reset , k1);   
     
   not(cm, clk);
   buf(cs , clk);
   
   srla master(cm, jm, km,js, ks);
   srla slave(cs, js, ks ,q, qb);   
endmodule 

module srla(
   input  clk,   
   input  s,
   input  r,
   output q,
   output qb
   );
   wire   s1;
   wire   r1;
   
   and(s1, clk, s);
   and(r1, clk, r);   
   nor(qb, s1, q);
   nor(q, r1, qb);
endmodule 