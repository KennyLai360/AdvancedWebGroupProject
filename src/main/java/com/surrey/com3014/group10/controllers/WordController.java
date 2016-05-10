/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

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
        super();

    }


    public void randomWord() {
        word = words.get(r.nextInt(words.size()));
//        console.log(word);
    }

    public String getWord() {
        return word;
    }

}


