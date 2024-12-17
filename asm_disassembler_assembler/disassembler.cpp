#include <iostream>
#include <string>
#include <vector>
#include <bitset>
#include <stdexcept>

using namespace std;


string bstois(const string& bs) {
    try {
        size_t pos;
        int result = stoi(bs, &pos, 2);
        if (pos == bs.length()) {
            return to_string(result); // Convert the integer to a string
        } else {
            throw invalid_argument("Invalid binary string"); // Throw an exception if not a valid binary string
        }
    } catch (out_of_range e) {
        throw out_of_range("Conversion failed"); // Throw an exception for out-of-range values
    } catch (invalid_argument e) {
        throw invalid_argument("Conversion failed"); // Throw an exception for invalid arguments
    }
}

bool ops(string line, string& result) {
    //0 = success
    //1 = wrong operation
    //2 = wrong args

    result = "";
    if(line.substr(0,4) == "0000"){
        try
        {
            result += "ADD R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3))+ ", R" + bstois(line.substr(10, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "0001"){
        try
        {
            result += "ADDI R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3))+ ", " + bstois(line.substr(10));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "0010"){
        try
        {
            result += "SUB R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3))+ ", R" + bstois(line.substr(10, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "0011"){
        try
        {
            result += "SUBI R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3))+ ", " + bstois(line.substr(10));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,3) == "010"){
        try
        {
            result += "NAND R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3))+ ", R" + bstois(line.substr(10, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,3) == "011"){
        try
        {
            result += "NOR R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3))+ ", R" + bstois(line.substr(10, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "1000"){
        try
        {
            result += "READ R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "1010"){
        try
        {
            result += "WRITE R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "1011"){
        try
        {
            result += "JMP R" + bstois(line.substr(4, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "1001"){
        try
        {
            result += "BEQ R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "1110"){
        try
        {
            result += "INP R" + bstois(line.substr(4, 3));
        }
        catch(exception e){ return false; }
    }else if(line.substr(0,4) == "1100"){
        try
        {
            result += "OUT R" + bstois(line.substr(4, 3)) + ", R" + bstois(line.substr(7, 3));
        }
        catch(exception e){ return false; }
    }else{
        return false;
    }
    
    return true;
}

string trim(string str) {
    int start = 0;
    while (start < str.length() && (str[start] == ' ' || str[start] == '\t')) {
        start++;
    }

    if (start == str.length()) {
        return "";
    }

    int end = str.length() - 1;
    while (end > start && (str[end] == ' ' || str[end] == '\t')) {
        end--;
    }

    return str.substr(start, end - start + 1);
}

int main() {
    string line;
    int count = 1;

    //trim
    while (getline(cin, line)) {
        int comm = 0;
        while (comm < line.length() && !(line[comm] == '/' && comm + 1 < line.length() && line[comm + 1] == '/')) {
            comm++;
        }

        line.erase(comm);
        line = trim(line);

        if (!line.empty()) {
            string result = "";
            if(ops(line, result)){
                cout << result << endl;
            }else{
                cout << "ERROR: line " << count << " (invalid operation)" << endl;
                return 0;
            }
        }
        count++;
    }
    return 0;
}