package com.example.eliseo.movies.models;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

/**
 * Created by Eliseo on 10/17/2016.
 */

public class Movie {
    String posterPath;

    public String getOriginalTitle() {
        return originalTitle;
    }

    public String getOverview() {
        return overview;
    }

    public String getPosterPath() {
        return String.format("https://image.tmdb.org/t/p/w342/%s", posterPath);
    }

    String originalTitle;
    String overview;

    //construct movie objects
    public Movie(JSONObject jsonObject) throws JSONException {
        this.posterPath = jsonObject.getString("poster_path");
        this.originalTitle = jsonObject.getString("original_title");
        this.overview = jsonObject.getString("overview");
    }

    //cycle through the returned array and use the movie constructor we made above^
    public static ArrayList<Movie> fromJSONArray(JSONArray array) {
        ArrayList<Movie> results = new ArrayList<>();

        for ( int x = 0 ; x < array.length() ; x++){
            try {
                results.add(new Movie(array.getJSONObject(x)) );
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return results;
    }
}
