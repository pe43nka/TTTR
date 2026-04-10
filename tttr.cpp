#include <iostream>
#include <unistd.h> //currently used for sleep()

using namespace std;

char b[9] = {'1','2','3','4','5','6','7','8','9'}; //board array
int gEnd = 0; //gameEnd. Ends the game when set to 1.
char pTurn = 'X'; //playerTurn. Shows which player's turn it is
int currTurn = -1; //shows current turn, used to initiate a tie in case players ran out of turns
int inp; //input


void gameReset() { //resets the game allowing to play again
    pTurn = 'X';
    currTurn = -1;

    for (int i = 0; i < 9; i ++) { //clears X's and O's
        b[i] = i+49; //brings back numbers
    }
}

void drawBoard() //used to draw the board when needed
{
    cout << "\t\n" << b[0] << " " << b[1] << " " << b[2] 
           << "\n" << b[3] << " " << b[4] << " " << b[5] 
           << "\n" << b[6] << " " << b[7] << " " << b[8] 
           << "\n" << "------------------------------------------" << endl; //separator
}

void changeBoardType() //toggles board look (numbers <-> dots)
{
    currTurn = currTurn - 1; //prevents changing board to be counted as a turn
    for (int i = 0; i < 9; i++) // loop for changing number to dots (and vice-versa)
    {
        if (b[i] != '.') {
            if (b[i] != 'X' && b[i] != 'O') { //makes sure that changing board look wont overlap X and O, essentially clearing the board
                b[i] = '.';
            }    
        } else {
            if (b[i] != 'X' && b[i] != 'O') { // ^ same here
                b[i] = i+49; //changes i to a number
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
        drawBoard();
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
        cout << "--------------------------------------------------\nGame Ended. Enter 1 to reset the board and play again, enter 0 to exit: " << endl; //invtes player to either play again or exit
        cin >> inp;
        if (inp == 1) {
            gameReset(); //game reset function
            } else if (inp == 0) {
                gEnd = 1; //ends the game if player enters 0
            }
        }
        
    if (currTurn == 8) { //tie logic
        drawBoard();
        cout << "--------------------------------------------------\nTie! Enter 1 to reset the board and play again, enter 0 to exit: ";
        cin >> inp;
        if (inp == 1) {
            gameReset(); //resets the game if 1 is entered
        } else if (inp == 0) {
            gEnd = 1; //ends the game if 0 is entered
        }
    }
}

int main() {

    while (gEnd == 0) //keeps the game running until gEnd variable is set to 1
    {
        drawBoard(); //draws the board before a turn
        currTurn = currTurn + 1; //increases turn calue to initiate a tie if needed
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
                sleep(3); //gives player time to read the error message
            } //(turn value will never be changed unless player entered a CORRECT input value (from 1-9 and shouldn't be occupied))
            winCheck();
        } else if (inp == 0) //allows player to change the board look
        {
            changeBoardType(); // ^^^
        } else {
            cout << "\n-----------------------------------------------\nYou can only enter numbers from 1-9. Try Again!\nProcceeding in 3 seconds...\n-----------------------------------------------" << endl;
            sleep(3); //gives player time to read the error message
        }
    }
}