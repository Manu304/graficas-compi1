package com.mrojas.graficoscompi1.model

class ErrorParser(val expectL:Int, val expectR: Int, val value: String, val expecteds: List<String>) {

    override fun toString(): String {
        return "ErrorParser(Fila=$expectL, Columna=$expectR, value='$value', expecteds=$expecteds)"
    }
}