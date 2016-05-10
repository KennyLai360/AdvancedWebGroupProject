/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.controllers;

import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Jonny
 */
public class WordController {
    ArrayList<String> words = new ArrayList<>();
    Random r = new Random();
    public static String word = "";


    /*
        The WordController constructor.
        This adds the words to list upon construction.
     */
    public WordController() {
        super();
        words.add("pineapple");
        words.add("time");
        words.add("horse");
        words.add("chef");
        words.add("dog");
        words.add("karate");
        words.add("browse");
        words.add("loud");
        words.add("collapse");
        words.add("late");
        words.add("tears");
        words.add("float");
        words.add("floorboard");
        words.add("plug");
        words.add("sit");
        words.add("dreams");
        words.add("bite");
        words.add("spanner");
        words.add("camera");
        words.add("razor");
        words.add("skateboard");
        words.add("glass");
        words.add("reflection");
        words.add("case");
        words.add("sign");
        words.add("enemy");
        words.add("routine");
        words.add("scared");
        words.add("screen");
        words.add("bloodshot");
        words.add("deadline");
        words.add("anxiety");
        words.add("slip");
        words.add("bumblebee");
        words.add("ice");
        words.add("igloo");
        words.add("drift");
        words.add("donut");
        words.add("lick");
        words.add("cat");
        words.add("exit");
        words.add("shirt");
        words.add("switch");
        words.add("gum");
    }


    /*
        Generates a random word from the list.
     */
    public void randomWord() {
        word = words.get(r.nextInt(words.size()));
//        console.log(word);
    }

    /*
        Gets the word.
     */
    public String getWord() {
        return word;
    }

}


