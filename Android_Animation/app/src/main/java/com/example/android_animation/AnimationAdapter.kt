package com.example.android_animation

import android.content.Context
import android.net.Uri
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.animation.Animation
import android.view.animation.AnimationUtils
import android.widget.ImageView
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.bumptech.glide.request.RequestOptions

class AnimationAdapter(private val context: Context) : RecyclerView.Adapter<RecyclerView.ViewHolder>() {
    private val width = 300
    private val height = 300
    private val IMAGES_COUNT = 400

    inner class RotateViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var mRotateImageView: ImageView
        var mAnimation: Animation
        fun bind(context: Context) {
            Glide
                .with(context)
                .load(Uri.parse("file:///android_asset/1.jpg"))
                .apply(RequestOptions().override(width, height))
                .into(mRotateImageView)
            mRotateImageView.animation = mAnimation
        }

        init {
            mRotateImageView = itemView.findViewById(R.id.imageView)
            mAnimation = AnimationUtils.loadAnimation(itemView.context, R.anim.rotate)
            mAnimation.fillAfter = true
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        val v = LayoutInflater.from(parent.context).inflate(R.layout.image, parent, false)
        return  RotateViewHolder(v)
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        (holder as RotateViewHolder).bind(context)
    }

    override fun getItemCount(): Int {
        return IMAGES_COUNT
    }

}
