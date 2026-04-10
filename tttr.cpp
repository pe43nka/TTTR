#include <iostream>
#include <unistd.h>

using namespace std;

char b[9] = {'1','2','3','4','5','6','7','8','9'}; //board
int gEnd = 0; //gameEnd. Ends the game when set to 1.
char pTurn = 'X'; //playerTurn. Shows which player's turn it is
int currTurn = -1;
int boardChangeStep = 0;

void drawBoard() //used to draw the board when needed
{
    cout << "\t\n" << b[0] << " " << b[1] << " " << b[2] 
           << "\n" << b[3] << " " << b[4] << " " << b[5] 
           << "\n" << b[6] << " " << b[7] << " " << b[8] 
           << "\n" << "------------------------------------------" << endl;
}

void changeBoardType()
{
    currTurn = currTurn - 1;
    for (int i = 0; i < 9; i++)
    {
        if (b[i] != '.') {
            if (b[i] != 'X' && b[i] != 'O') {
                b[i] = '.';
            }    
        } else {
            if (b[i] != 'X' && b[i] != 'O') {
                b[i] = i+49;
            }  
        }
    }
    
    
}

void winCheck() //check for win
{
    if (   (b[0] != '.' && b[0] == b[1] && b[1] == b[2]) //horizLine1
        || (b[3] != '.' && b[3] == b[4] && b[4] == b[5]) //horizLine2
        || (b[6] != '.' && b[6] == b[7] && b[7] == b[8]) //horizLine1
        || (b[0] != '.' && b[0] == b[4] && b[4] == b[8]) //diagTL/BR
        || (b[2] != '.' && b[2] == b[4] && b[4] == b[6]) //diagTR/BL
        || (b[0] != '.' && b[0] == b[3] && b[3] == b[6]) //verticLine1
        || (b[1] != '.' && b[1] == b[4] && b[4] == b[7]) //verticLine2
        || (b[2] != '.' && b[2] == b[5] && b[5] == b[8]) //verticLine3
    ) {
        gEnd = 1; //ends the game if a win pattern is found
        drawBoard(); //draws the board to show win pattern
        switch (pTurn) //switches player turn back to the winner
        {
            case 'X':
            pTurn = 'O';
            break;
        
            case 'O':
            pTurn = 'X';
            break;

        default:
            break;
        }
        cout << pTurn << " won!" << endl; //shows the winner
        }
}

int main() {
    
    int inp = 0; //input

    while (gEnd == 0) //keeps the game running until gEnd variable is set to 1
    {
        drawBoard(); //draws the board before a turn
        currTurn = currTurn + 1;
        cout << "Player Turn: " << pTurn << " | Current Turn: " << currTurn << "\nEnter 0 to change the board look" << endl; //shows either X or O depending on which player's turn it is

        cout << "Enter any number between 1-9 to put a shape: "; //notifies player to only enter numbers from 1-9
        cin >> inp; //player input
        if (inp > 0 && inp < 10) //checks if input is correct
        {
       
            if (b[inp-1] != 'X' && b[inp-1] != 'O') //checks if this tile is occupied
            {
                if (pTurn == 'X') //if not, checks for turn value (X/O)
                {
                    b[inp-1] = 'X'; //if X, changes array element "input - 1" ("- 1" is made due to element's index and displayed index being different by 1)
                    pTurn = 'O'; //switches player turn value
                } else {
                    b[inp-1] = 'O'; //same as X, but if turn is O
                    pTurn = 'X'; //switches player turn value
                }
            } else {
                cout << "\n-----------------------------------------------\nThis tile is occupied. Try again!\nProcceeding in 3 seconds...\n-----------------------------------------------" << endl; //if tile IS occupied. notifies the player AND DOESNT change the turn value
                sleep(3); //gives player time to read the error message.
            } //(turn value will never be changed unless player entered a CORRECT input value (from 1-9 and shouldn't be occupied))
            winCheck();
        } else if (inp == 0) 
        {
            changeBoardType();
        } else {
            cout << "\n-----------------------------------------------\nYou can only enter numbers from 1-9. Try Again!\nProcceeding in 3 seconds...\n-----------------------------------------------" << endl;
            sleep(3);
        }
    }
}