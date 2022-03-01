package com.mrojas.graficoscompi1.controllers

class Semantic {

    private var existsError=false;

    fun registrarError(expectL:Int, expectR: Int, value: String, expecteds: List<String>){
        println("Error en la fila $expectL y columana $expectR. Se esperaba: $expecteds \nEn lugar de $value");
        existsError = true;
    }
}