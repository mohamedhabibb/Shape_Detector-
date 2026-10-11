🔷 Shape Detector (x86 Assembly)

A small 8086 Assembly language program that asks the user for the number of points of a shape, detects what kind of shape it is, and then draws it on screen using VGA graphics mode (13h).

✨ Features
🔢 Shape detection by number of points
3 points (or fewer) → Triangle
4 points → Rectangle or Square
More than 4 points → prints UNKNOWN
📐 Square vs. Rectangle check – the program takes 4 points (x,y), computes the width and height differences, and compares them.
🖍️ Draws the detected shape on the screen using BIOS video interrupts (INT 10h, function 0Ch – write pixel).
Rectangle (100 × 50 pixels)
Square (intended 100 × 100 pixels)
Triangle (hard-coded size)
⌨️ Interactive console input – the program prints the ( , ) formatting itself while you type the digits.
🎨 Colored output in 320×200, 256-color graphics mode (mov al, 13h / int 10h).
🪶 Tiny: a single .asm file, no external libraries.
🛠️ Technologies
Item	Details
Language	8086 Assembly (16-bit, real mode)
Memory model	.model small, org 100h
DOS services	INT 21h (AH=01h read char, AH=02h print char, AH=09h print string, AH=4Ch exit)
BIOS services	INT 10h (AH=00h set video mode, AH=0Ch draw pixel, AH=06h scroll/clear)
Video mode	13h – 320×200, 256 colors
Recommended tool	emu8086
🚀 How to Run
Option 1: emu8086 (recommended)
Open shape.asm in emu8086.
Click Compile then Run (or press F9).
Follow the on-screen prompts.
Option 2: DOSBox + an assembler (TASM / MASM)
bash
tasm shape.asm
tlink /t shape.obj
shape.com

The code was written in emu8086 style, so small syntax tweaks may be needed for other assemblers.

🕹️ How to Use
Run the program. It shows:
   Enter Number of points > 2 ...
Type the number of points (a single digit).
Triangle (3 points)

The program asks for 3 points. Type the x digit then the y digit for each point – the program prints (x,y) for you. Then it clears the screen and draws a triangle.

4 points → Rectangle / Square

Type 4 points the same way (single digits). The program compares (x1 − x2) with (y3 − y4):

Equal → Square
Not equal → Rectangle

Example (square):

Enter Number of points > 2 ... 4
RECTANGALE OR SQUARE....  (1,1)(4,1)(1,1)(1,4)
Square...
More than 4 points
UNKNOWN.....
📁 Project Structure
.
├── shape.asm     # The full source code
└── README.md     # This file
Code overview
Section	What it does
.data	Messages (msg1…msg6) and variables (v1…v4)
main	Reads the number of points and branches (je / jl)
eq4	Reads 4 points, computes width/height difference, decides square or rectangle
l1–l4	Pixel loops that draw the rectangle's 4 sides
ll1–ll4	Pixel loops that draw the square's 4 sides
TRIANGLE	Reads 3 points, clears the screen, draws a triangle with 3 lines
