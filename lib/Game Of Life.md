# Conway's Game of Life

## Background

Conway's Game of Life is a cellular automaton that is played on an (infinite) 2D square grid. Each square (or "cell") on the grid can be either alive or dead, based on how it interacts with its eight neighbors (which are the cells that are directly horizontally, vertically, or diagonally adjacent). 

**References:** 
 * [Game of Life](https://conwaylife.com/wiki/Conway%27s_Game_of_Life)
 * See it in action [here](https://conwaylife.com/)

## Rules

That is, cells evolve according to the following **rules** at each step in time:

 * Any live cell with **fewer than two live** neighbours _dies_ (referred to as underpopulation).
 * Any live cell with **more than three live** neighbours _dies_ (referred to as overpopulation).
 * Any live cell with **two or three live** neighbours _lives_, unchanged, to the next generation.
 * Any **dead** cell with exactly **three live** neighbours _comes to life_.

## The Play

The initial configuration of cells can be created by a human (or random), but all generations thereafter are completely determined by the above rules. 

The goal of the game is to find patterns that evolve in interesting ways – something that people have now been doing for over 50 years.
