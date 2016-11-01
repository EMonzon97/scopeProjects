package com.example.eliseo.movies.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.eliseo.movies.R;
import com.example.eliseo.movies.models.Movie;
import com.squareup.picasso.Picasso;

import java.util.List;

/**
 * Created by Eliseo on 10/18/2016.
 */

public class MovieArrayAdapter  extends ArrayAdapter<Movie> {

    //our constructor
    public MovieArrayAdapter(Context context , List<Movie> movies){
        super(context, android.R.layout.simple_list_item_1, movies);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        //get data item for this position
        Movie movie = getItem(position);

        //check if existing view is reuesed
        if(convertView == null){
            LayoutInflater inflater = LayoutInflater.from(getContext());
            convertView = inflater.inflate(R.layout.item_movie , parent , false);
        }

        //find imageview
        ImageView ivImage = (ImageView) convertView.findViewById(R.id.ivMovieImage);
        //clear out image from convert view
        ivImage.setImageResource(0);

        TextView tvTitle = (TextView) convertView.findViewById(R.id.tvTitle);
        TextView tvOverview = (TextView) convertView.findViewById(R.id.tvOverview);

        // populate
        tvTitle.setText(movie.getOriginalTitle());
        tvOverview.setText(movie.getOverview());

        //photo
        Picasso.with(getContext()).load(movie.getPosterPath()).into(ivImage);

        return convertView;

    }
}
