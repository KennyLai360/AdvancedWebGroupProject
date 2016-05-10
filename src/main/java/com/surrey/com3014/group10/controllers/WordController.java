/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
//import java.lang.System.console;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jonny
 */
public class WordController {
    File file;
    FileReader fr;
    BufferedReader br;
    ArrayList<String> words = new ArrayList<>();
    long seed =  System.currentTimeMillis();
    Random r = new Random();
    public static String word = "";

    public WordController() {
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

//        super();
//        file = new File("'../../static/wordlist.txt");
//        try {
//            this.fr = new FileReader(file);
//            this.br = new BufferedReader(fr);
//            String line;
//            while (br.readLine() != null) {
//                line = br.readLine();
//                words.add(line);
//            }
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(WordController.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (IOException ex) {
//            Logger.getLogger(WordController.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }


    public void randomWord() {
        word = words.get(r.nextInt(words.size()));
//        console.log(word);
    }

    public String getWord() {
        return word;
    }

}


