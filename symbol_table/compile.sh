lex symbol.l
yacc symbol.y
gcc y.tab.c -ll -ly
./a.out<input.txt

