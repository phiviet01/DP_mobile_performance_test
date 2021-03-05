package com.example.kotlin

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        startButton.setOnClickListener {
            println("start")
            val startTime = System.currentTimeMillis()
            val round = 100
            for (i in 0 until round) {
                getPIByGaussLegendre(10000000)
            }
            val endTime = System.currentTimeMillis()
            println("end")
            val executionTime = (endTime - startTime) / round
            tvExecutionTime.text = "${executionTime} ms"
        }
    }

    private fun getPIByGaussLegendre(rounds: Int): Double {
        var a0 = 1.0
        var b0 = 1.0 / Math.sqrt(2.0)
        var t0 = 1.0 / 4.0
        var p0 = 1.0
        for (i in 0 until rounds) {
            val an = (a0 + b0) / 2
            val bn = Math.sqrt(a0 * b0)
            val tn = t0 - p0 * Math.pow(a0 - an, 2.0)
            val pn = 2 * p0
            a0 = an
            b0 = bn
            t0 = tn
            p0 = pn
        }
        return Math.pow(a0 + b0, 2.0) / (4 * t0)
    }
}
