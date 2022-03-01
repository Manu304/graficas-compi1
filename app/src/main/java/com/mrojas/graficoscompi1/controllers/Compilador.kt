package com.mrojas.graficoscompi1.controllers

import com.mrojas.graficoscompi1.analizadores.lexer.Lexer
import com.mrojas.graficoscompi1.analizadores.parser.Parser
import com.mrojas.graficoscompi1.model.ErrorParser
import java.io.Reader
import java.io.StringReader
import java.lang.Exception

class Compilador(val txtCompilar: String) {
    private var lexer: Lexer?=null;
    private var parser: Parser? = null;
    private var graficos: String? = null;
    private var graficosEjecutar: String? = null;
    private var errores: List<ErrorParser>? = null;

    fun start(){
        val reader: Reader = StringReader(txtCompilar);
        lexer = Lexer(reader);
        parser= Parser(lexer);

        try {
            parser!!.parse();
            /*
            println("\nSe han encontrado las graficas: \n");
            println(parser!!.graficos);
            println("\nSe han encontrado las ejecuciones: \n");
            println(parser!!.graficosEjecutar);
            */
            graficos = parser!!.graficos;
            graficosEjecutar = parser!!.graficosEjecutar;
            errores = parser!!.errores;

            println("Graficos: \n$graficos \nEjecutar:\n$graficosEjecutar\nErrores:\n");
            for (error in errores!!){
                println(errores);
            }
        }catch (e: Exception){
            println("Se ha manejado el error");
        }
    }

    fun crearGrafico(){

    }
}