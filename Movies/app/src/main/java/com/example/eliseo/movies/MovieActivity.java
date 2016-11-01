package com.example.eliseo.movies;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.ListView;

import com.example.eliseo.movies.adapters.MovieArrayAdapter;
import com.example.eliseo.movies.models.Movie;
import com.loopj.android.http.AsyncHttpClient;
import com.loopj.android.http.JsonHttpResponseHandler;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import cz.msebera.android.httpclient.Header;

public class MovieActivity extends AppCompatActivity {

    //arraylist of movies
    ArrayList<Movie> movies;

    //adapter for the hookup
    MovieArrayAdapter movieAdapter;
    ListView lvItems;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_movie);

        //connect the listview to the one in the preview
        lvItems = (ListView) findViewById(R.id.lvMovies);
        movies = new ArrayList<>();
        //constructor
        movieAdapter = new MovieArrayAdapter(this , movies);
        //now insert the adapter into the listview
        lvItems.setAdapter(movieAdapter);


        String url = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";

        AsyncHttpClient client = new AsyncHttpClient();
        client.get(url, new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                JSONArray movieJsonResults = null;

                try {
                    //retrieve JSON
                    movieJsonResults = response.getJSONArray("results");
                    //pupulate with movies
                    movies.addAll(Movie.fromJSONArray(movieJsonResults));

                    movieAdapter.notifyDataSetChanged();
                    Log.d("DEBUG" , movies.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                super.onFailure(statusCode, headers, responseString, throwable);
            }
        });



    }
}
