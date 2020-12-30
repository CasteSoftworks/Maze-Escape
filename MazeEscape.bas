 rem Generated 29/11/2017 17:12:21 by Visual bB Version 1.0.0.554
 rem **********************************
 rem *<Maze Escape >                      *
 rem *<Try to not touch the maze and arrive at the end of the labyrinth >                   *
rem *<CasteSoftwork >                        *
 rem *<All Rights Reserved >                       *
 rem **********************************

 set romsize 4k
 set tv ntsc
 set smartbranching on
 set kernel_option no_blank_lines
 a=25 : b =16 : c=0
 x=75:y=75:c=0
 d=130 : e=12
 rem objective x 130 y 17 in level 1 
 player0x=130
 player0y=16 
 const noscore=1


opening

 playfield:
 ......X.X...XXX..XXXXX..XXXX....
 .....X.X.X.X...X....X..X........
 .....X...X.XXXXX...X...XXX......
 .....X...X.X...X..X....X........
 .....X...X.X...X.XXXXX..XXXX....
 ................................
 ...XXX.XXXX..XXX.XXXX..XX..XXXX.
 ..X....X....X....X..X.X..X.X....
 ..XX...XXXX.X....XXXX.X..X.XXX..
 ..X.......X.X....X..X.XXX..X....
 ...XXX.XXXX..XXX.X..X.X....XXXX.
end
title
 COLUBK = $00
 COLUPF = $0E
 drawscreen
 if joy0fire || joy1fire then goto skiptitle
 goto title
 
skiptitle
 goto livello1


vinto
 playfield:
 ...........X.X.XXX.X............
 ...........X.X.X.X.X............
 ...........XXX.XXX.X............
 ...........X.X.X.X.X............
 ...........X.X.X.X.X............
 ................................
 ......X.X.X.X..X.XXX.XXX........
 ......X.X.X.XX.X..X..X.X........
 ......X.X.X.X.XX..X..X.X........
 ......X.X.X.X..X..X..X.X........
 .......X..X.X..X..X..XXX........
end
ye
 COLUBK = $00
 COLUPF = $0E
 drawscreen
 if joy0fire || joy1fire then goto skipye
 goto ye

skipye
 reboot


livello1 
 c=0
 playfield:
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
end

   COLUBK = $0E : rem * The background (paths) will be white
   COLUPF = $00 : rem * The playfield (walls) will be black
   rem * First we draw a grid of walls and cells
   rem * The maze has 7 cells across and 5 cells down
   rem * The last (8th) column of cells will be the maze exit
   rem * Draw horizontal walls
   for y = 0 to 10 step 2
      pfhline 0 y 29 on
   next
   rem * Draw veritcal walls 
   for x = 0 to 28 step 4
      t = x + 1
      pfvline x 0 10 on
      pfvline t 0 10 on
   next
   rem * Draw the path of level 1 
   pfpixel 4 1 off : pfpixel 5 1 off
   pfpixel 8 1 off : pfpixel 9 1 off
   pfpixel 12 1 off : pfpixel 13 1 off
   pfpixel 16 1 off : pfpixel 17 1 off
   pfpixel 28 1 off : pfpixel 29 1 off
   pfpixel 2 2 off : pfpixel 3 2 off
   pfpixel 6 2 off : pfpixel 7 2 off
   pfpixel 22 2 off : pfpixel 23 2 off
   pfpixel 26 2 off : pfpixel 27 2 off
   pfpixel 12 3 off : pfpixel 13 3 off
   pfpixel 16 3 off : pfpixel 17 3 off
   pfpixel 24 3 off : pfpixel 25 3 off
   pfpixel 2 4 off : pfpixel 3 4 off
   pfpixel 6 4 off : pfpixel 7 4 off
   pfpixel 10 4 off : pfpixel 11 4 off
   pfpixel 14 4 off : pfpixel 15 4 off
   pfpixel 18 4 off : pfpixel 19 4 off
   pfpixel 22 4 off : pfpixel 23 4 off
   pfpixel 8 5 off : pfpixel 9 5 off
   pfpixel 2 6 off : pfpixel 3 6 off
   pfpixel 14 6 off : pfpixel 15 6 off
   pfpixel 22 6 off : pfpixel 23 6 off
   pfpixel 26 6 off : pfpixel 27 6 off
   pfpixel 4 7 off : pfpixel 5 7 off
   pfpixel 12 7 off : pfpixel 13 7 off
   pfpixel 20 7 off : pfpixel 21 7 off
   pfpixel 24 7 off : pfpixel 25 7 off
   pfpixel 6 8 off : pfpixel 7 8 off
   pfpixel 10 8 off : pfpixel 11 8 off
   pfpixel 26 8 off : pfpixel 27 8 off
   pfpixel 4 9 off : pfpixel 5 9 off
   pfpixel 12 9 off : pfpixel 13 9 off
   pfpixel 16 9 off : pfpixel 17 9 off
   pfpixel 20 9 off : pfpixel 21 9 off
   pfpixel 24 9 off : pfpixel 25 9 off
 
main
 player0:
 %00000000
 %00000000
 %00011000
 %00111100
 %00111100
 %00011000
 %00000000
 %00000000
end
 
 player1:
 %00000000
 %00101000
 %00010000
 %00111000
 %00010000
 %00101000
 %00010000
 %00000000
end
 
 drawscreen
 player1x=a
 player1y=b
 

 if collision(player1,playfield) then a=25:b=16
 if c=0 && collision(player1,player0) then c=c+1: a=25 : b=16 : goto livello2
 if c=1 && collision(player1,player0) then goto vinto
 if joy0right then a=a+1 :  REFP1 = 0
 if joy0left then a=a-1 :  REFP1 = 8
 if joy0up then b=b-1
 if joy0down then b=b+1
 goto main


livello2
 rem * level 2 will be drawn 
 playfield:
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
   ................................
end
 
 rem * Fixes player position 
 player1x=a
 player1y=b
 rem * Fixes objective position 
 player0x=d
 player0y=e+4
 rem * Draw orizontal walls 
   for y = 0 to 10 step 2
      pfhline 0 y 29 on
   next
   rem * Draw vertical walls
   for x = 0 to 28 step 4
      t = x + 1
      pfvline x 0 10 on
      pfvline t 0 10 on
   next
 rem * Draw path of level 2 
 pfpixel 4 1 off : pfpixel 5 1 off
 pfpixel 8 1 off : pfpixel 9 1 off
 pfpixel 6 2 off : pfpixel 7 2 off 
 pfpixel 6 4 off : pfpixel 7 4 off 
 pfpixel 2 6 off : pfpixel 3 6 off 
 pfpixel 2 8 off : pfpixel 3 8 off 
 pfpixel 4 8 off : pfpixel 5 8 off 
 pfpixel 6 8 off : pfpixel 7 8 off 
 pfpixel 8 9 off : pfpixel 9 9 off 
 pfpixel 8 7 off : pfpixel 9 7 off 
 pfpixel 12 7 off : pfpixel 13 7 off 
 pfpixel 12 9 off : pfpixel 13 9 off 
 pfpixel 14 8 off : pfpixel 15 8 off 
 pfpixel 16 8 off : pfpixel 17 8 off 
 pfpixel 12 1 off : pfpixel 13 1 off
 pfpixel 16 1 off : pfpixel 17 1 off
 pfpixel 28 1 off : pfpixel 29 1 off
 pfpixel 26 4 off : pfpixel 27 4 off
 pfpixel 26 6 off : pfpixel 27 6 off 
 pfpixel 26 8 off : pfpixel 27 8 off  
 pfpixel 22 2 off : pfpixel 23 2 off
 pfpixel 24 1 off : pfpixel 25 1 off
 pfpixel 24 3 off : pfpixel 25 3 off
 pfpixel 2 4 off : pfpixel 3 4 off 
 pfpixel 4 5 off : pfpixel 5 5 off 
 pfpixel 8 5 off : pfpixel 9 5 off 
 pfpixel 12 5 off : pfpixel 13 5 off 
 pfpixel 24 9 off : pfpixel 25 9 off 
 pfpixel 20 9 off : pfpixel 21 9 off 
 pfpixel 18 8 off : pfpixel 19 8 off 
 pfpixel 18 6 off : pfpixel 19 6 off 
 pfpixel 8 3 off : pfpixel 9 3 off 
 pfpixel 12 3 off : pfpixel 13 3 off 
 pfpixel 16 3 off : pfpixel 17 3 off 
 pfpixel 22 6 off : pfpixel 23 6 off 
 pfpixel 22 8 off : pfpixel 23 8 off 

 goto main

