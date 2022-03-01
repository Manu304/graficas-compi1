package com.mrojas.graficoscompi1.model

import com.mrojas.graficoscompi1.graphics.Coordenada

class GraficoPie(titulo: String, unir: ArrayList<Coordenada>, val etiquetas: ArrayList<String>, val valores: ArrayList<Double>, val tipo: Tipo, val total: Double, val extra: String) : Grafica(titulo, unir) {

    enum class Tipo{
        CANTIDAD, PORCENTAJE
    }

}