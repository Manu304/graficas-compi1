package com.mrojas.graficoscompi1.analizadores.lexer;

import java_cup.runtime.*;
import com.mrojas.graficoscompi1.analizadores.parser.*;

%%
/*segunda sección: configuración */

%class Lexer
%public
%cup
%unicode
%line
%column

%state COMENTARIO_LINEA
%state STRINGP

WhiteSpace = [\r|\n|\r\n] | [ \t\f]
/* TOKENS DE NUMEROS */
NUMERO_ENTERO = [0-9]+
NUMERO_DECIMAL = ({NUMERO_ENTERO})([.])({NUMERO_ENTERO})

/* TOKENS DE OPERADORES ARITMETICOS */
SIGNO_MAS = "+"
SIGNO_MENOS = "-"
SIGNO_POR = "*"
SIGNO_DIVISION = "/"
PARENTESIS_I = "("
PARENTESIS_D = ")"
CORCHETE_I = "["
CORCHETE_D = "]"
LLAVE_I = "{"
LLAVE_D = "}"
COMA = ","
PUNTO_COMA = ";"
DOS_PUNTOS = ":"
COMILLA = [\u0022]

/* TOKENS PARA COMENTARIOS DE LINEA */
INICIO_COMENTARIO_LINEA = "#"

/* TOKENS PARA PALABRAS RESERVADAS */
/* PALABRAS RESERVADAS PARA USO GENERAL DE GRAFICAS */
INICIO_DECLARACION = "Def" | "def"
TIPO_GRAFICO = "Barras" | "Pie"
TITULO_GRAFICO = "titulo"
UNIR = "unir"
EJECUTAR = "Ejecutar"

/* PALABRAS RESERVADAS GRAFICA DE BARRAS */
EJEX = "ejex"
EJEY = "ejey"

/* PALABRAS RESERVADAS GRAFICA DE PIE */
ETIQUETAS = "etiquetas"
VALORES = "valores"
TIPO = "tipo"
CANTIDAD = "Cantidad"
PORCENTAJE = "Porcentaje"
TOTAL = "total"
EXTRA = "extra"

%{
StringBuilder string = new StringBuilder();

  private Symbol symbol(int type) {
    return new Symbol(type, yyline+1, yycolumn+1);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline+1, yycolumn+1, value);
  }


  private void error(String message) {
    System.out.println("Error en linea: "+(yyline+1)+", columna "+(yycolumn+1)+" : "+message);
  }
%}

%%

/* REGLAS LEXICAS */
<YYINITIAL> {
{WhiteSpace} 	{/* ignoramos */}
{INICIO_COMENTARIO_LINEA} {yybegin(COMENTARIO_LINEA);}
{COMILLA} {string.setLength(0); yybegin(STRINGP);}

/*PALABRAS RESERVADAS GENERALES*/
{INICIO_DECLARACION} {return symbol(sym.INICIO_DECLARACION, yytext());}
{TIPO_GRAFICO} {return symbol(sym.TIPO_GRAFICO, yytext());}
{TITULO_GRAFICO} {return symbol(sym.TITULO_GRAFICO, yytext());}
{UNIR} {return symbol(sym.UNIR, yytext());}
{EJECUTAR} {return symbol(sym.EJECUTAR, yytext());}

/* PALABRAS RESERVADAS GRAFICA DE BARRAS */
{EJEX} {return symbol(sym.EJEX, yytext());}
{EJEY} {return symbol(sym.EJEY, yytext());}

/* PALABRAS RESERVADAS GRAFICA DE PIE */
{ETIQUETAS} {return symbol(sym.ETIQUETAS, yytext());}
{VALORES} {return symbol(sym.VALORES, yytext());}
{TIPO} {return symbol(sym.TIPO, yytext());}
{CANTIDAD} {return symbol(sym.CANTIDAD, yytext());}
{PORCENTAJE} {return symbol(sym.PORCENTAJE, yytext());}
{TOTAL} {return symbol(sym.TOTAL, yytext());}
{EXTRA} {return symbol(sym.EXTRA, yytext());}

/*SIMBOLOS*/
{SIGNO_MAS} {return symbol(sym.SIGNO_MAS, yytext());}
{SIGNO_MENOS} {return symbol(sym.SIGNO_MENOS, yytext());}
{SIGNO_POR} {return symbol(sym.SIGNO_POR, yytext());}
{SIGNO_DIVISION} {return symbol(sym.SIGNO_DIVISION, yytext());}
{PARENTESIS_I} {return symbol(sym.PARENTESIS_I, yytext());}
{PARENTESIS_D} {return symbol(sym.PARENTESIS_D, yytext());}
{CORCHETE_I} {return symbol(sym.CORCHETE_I, yytext());}
{CORCHETE_D} {return symbol(sym.CORCHETE_D, yytext());}
{LLAVE_I} {return symbol(sym.LLAVE_I, yytext());}
{LLAVE_D} {return symbol(sym.LLAVE_D, yytext());}
{COMA} {return symbol(sym.COMA, yytext());}
{PUNTO_COMA} {return symbol(sym.PUNTO_COMA, yytext());}
{DOS_PUNTOS} {return symbol(sym.DOS_PUNTOS, yytext());}

/*NUMEROS*/
{NUMERO_ENTERO} {return symbol(sym.NUMERO_ENTERO, new Double(yytext()));}
{NUMERO_DECIMAL} {return symbol(sym.NUMERO_DECIMAL, new Double(yytext()));}

}

<COMENTARIO_LINEA> {
    [\n] {yybegin(YYINITIAL);}
    [^]  {;}
}

<STRINGP> {
  {COMILLA} {yybegin(YYINITIAL); return symbol(sym.STRINGP, string.toString());}
  [^]  {string.append(yytext());}
}

[^] {error("Simbolo inválido<" + yytext()+">");}

<<EOF>>                 { return symbol(sym.EOF); }