/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.surrey.com3014.group10.controllers;

/**
 *
 * @author Jonny
 */
public class DrawData {
    
    
int clickX;
int clickY;
int clickDrag;
int paint;
int clickColor;
int clickSize;
    
    
    public int[] getImageData(){
        int[] stuff = new int[]{clickX, clickY, clickDrag, clickSize};
        return stuff;
    }

    
}
