package com.example.android_animation

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (supportActionBar != null)  {
            supportActionBar?.hide()
        }

        setContentView(R.layout.activity_main)
        rvView.layoutManager = GridLayoutManager(this, 10)
        rvView.setHasFixedSize(false)
        rvView.adapter = AnimationAdapter(this)
    }
}
