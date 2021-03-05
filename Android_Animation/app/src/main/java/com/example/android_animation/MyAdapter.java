package com.example.android_animation;

import android.content.Context;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.request.RequestOptions;

public class MyAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    private final Context context;
    private final static int width = 300;
    private final static int height = 300;
    private final int IMAGES_COUNT = 200;

    public MyAdapter(Context context) {
        this.context = context;
    }

    public static class RotateViewHolder extends RecyclerView.ViewHolder {
        ImageView mRotateImageView;
        Animation mAnimation;

        public RotateViewHolder(@NonNull View itemView) {
            super(itemView);
            mRotateImageView = itemView.findViewById(R.id.imageView);
            mAnimation = AnimationUtils.loadAnimation(itemView.getContext(), R.anim.rotate);
            mAnimation.setFillAfter(true);
        }

        public void bind(Context context) {
            Glide
                    .with(context)
                    .load(Uri.parse("file:///android_asset/1.jpg"))
                    .apply(new RequestOptions().override(width))
                    .into(mRotateImageView);
            mRotateImageView.setAnimation(mAnimation);
        }
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.image, parent, false);
        return new RotateViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        ((RotateViewHolder) holder).bind(context);
    }

    @Override
    public int getItemCount() {
        return IMAGES_COUNT;
    }
}
