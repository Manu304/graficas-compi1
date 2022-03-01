package com.mrojas.graficoscompi1

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText
import com.mrojas.graficoscompi1.analizadores.lexer.Lexer
import com.mrojas.graficoscompi1.analizadores.parser.Parser
import com.mrojas.graficoscompi1.controllers.Compilador
import java.io.Reader
import java.io.StringReader
import java.lang.Exception

class MainActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)




    }

    fun compilar(view: View){
        var textEditor: EditText ?= null;
        textEditor = findViewById(R.id.textEditor);
        if (textEditor != null){
            val compilador = Compilador(textEditor.text.toString());
            compilador.start();

        }
        /*
        val reader: Reader = StringReader(textEditor?.text.toString());
        val lexer: Lexer = Lexer(reader);
        val parser: Parser = Parser(lexer);

        try {
            parser.parse();
            println("\nSe han encontrado las graficas: \n");
            println(parser.graficos);
            println("\nSe han encontrado las ejecuciones: \n");
            println(parser.graficosEjecutar);
        }catch (e: Exception){
            println("Se ha manejado el error");
        }
        */

    }
}