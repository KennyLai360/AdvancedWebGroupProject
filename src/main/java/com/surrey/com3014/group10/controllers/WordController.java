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
        words.add("poo");
        words.add("copy");
        words.add("paste");
        words.add("bumhole digeridoo");
        words.add("spaghetti-os");
        words.add("dread");
        words.add("dispair");
        words.add("no hope");
        words.add("i cry myself to sleep at night");
        words.add("muffin man");

    }
//        file = new File("wordlist.txt");
//        try {
//            this.fr = new FileReader(file);
//            this.br = new BufferedReader(fr);
//            String line;
//            while (br.readLine() != null) {
//                line = br.readLine();
//                words.add(line);
//            }
//            System.out.println(words.get(0));
//
//        } catch (FileNotFoundException ex) {
//            Logger.getLogger(WordController.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (IOException ex) {
//            Logger.getLogger(WordController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }

    public void randomWord() {
        word = words.get(r.nextInt(words.size()));
//        console.log(word);
    }

    public String getWord() {
        return word;
    }

}

