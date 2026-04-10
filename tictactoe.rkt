#lang racket
;load library to draw objects
(require 2htdp/image)

;Alvin Pierre-Louis
;Comp 340-Project 3

;drawing whitebox
(define (whitebox)(rectangle 80 80 "solid" "white"))
;(whitebox)

;drawing transparent box
(define (transpbox)(rectangle 80 80 0 "white"))
;(transpbox)

;set up pen with desired color and desired width
(define (pensetup pencolor penwidth)(pen pencolor penwidth "solid" "round" "round"))
;(pensetup "red" 3)
;(pensetup "black" 5)

;Part 1. O mark

 ;draws a red circle
(define (singlecircle) (circle 20 "outline" (pensetup "red" 3)))
;(singlecircle)

;puts the circle in a white square
(define (omark) (overlay (singlecircle) (whitebox)))
;(omark)

;Part 2. X mark
;draws a blue diagonal line
(define (singleline)(line 30 30 (pensetup "blue" 3)))
;(singleline)

;flips the blue line horizontal
(define (flipsingleline) (flip-horizontal (singleline)))
;(flipsingleline)

;combines lines into an X
(define (xlines) (overlay (singleline) (flipsingleline)))
;(xlines)

;creates an X
(define (xmark) (overlay (xlines) (whitebox)))
;(xmark)

;Part 3. whole board with O's and X's
(define (wholeboard) (above (beside (omark) (omark) (omark))
                            (beside (xmark) (xmark) (xmark))
                            (beside (omark) (omark) (omark))))
;(wholeboard)

;Part 4. Grid
;draws a black vertical line
(define (vline)(line 0 200 (pensetup "black" 5)))
;(vline)

;puts vertical black line in transparent box
(define (vertline) (overlay (vline) (transpbox)))
;(vertline)

;two vertical black lines
(define (vertgrid) (beside (vertline) (vertline)))
;(vertgrid)

;two horizontal black lines
(define (horigrid)(rotate 90 (vertgrid)))
;(horigrid)

;intersect both vertical and horizontal lines
(define (grid) (overlay (vertgrid) (horigrid)))
;(grid)

;Part 5. Tic-tac-toe stage
(define (tictactoe) (overlay (grid) (wholeboard)))
;(tictactoe)

(save-image (tictactoe) "tictactoe.png")