import java_cup.runtime.Symbol;
%%
%unicode
%cup
%line
%column
%{
	public int getYyLine(){
		return yyline+1;
	}
	public int getYyColumn(){
		return yycolumn+1;
	}
	public String getYyText(){
		return yytext();
	}
%}

NB = [0-9]+
ID = [a-zA-Z]+([0-9]+[a-zA-Z]*)*
TABLEAU = \{[0-9]+(,[0-9]+)*\}
IGNORE = [\t ]
%%
"PRINT" { return new Symbol(sym.PRINT); }
{ID} { return new Symbol(sym.ID, new String(yytext())); }
{TABLEAU} { return new Symbol(sym.TABLEAU, new String(yytext())); }
{NB} { return new Symbol(sym.NB, new Integer(yytext())); }
"+" { return new Symbol(sym.ADD); }
"*" { return new Symbol(sym.MULT); }
"{" { return new Symbol(sym.ACOLAD_O); }
"}" { return new Symbol(sym.ACOLAD_F); }
"[" { return new Symbol(sym.ACROCHET_O); }
"]" { return new Symbol(sym.ACROCHET_F); }
"," { return new Symbol(sym.VIRGULE); }
"^" { return new Symbol(sym.CONCAT); }
"(" { return new Symbol(sym.PARENTHES_O); }
")" { return new Symbol(sym.PARENTHES_F); }
"=" { return new Symbol(sym.EGALE); }
"@" { return new Symbol(sym.ARUBAS); }
[\n] { return new Symbol(sym.NL);   }
{IGNORE} {}
. {System.out.println("ERREUR lexicale : caractere illegal : <"+ yytext()+"> ligne "+ (yyline+1)+ " colonne " + (yycolumn+1));} 
