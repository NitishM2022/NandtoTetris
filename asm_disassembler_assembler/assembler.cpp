#include <iostream>
#include <string>
#include <vector>
#include <bitset>

using namespace std;


string itobs(int number, int dl) {
    return bitset<64>(number).to_string().substr(64 - dl);
}

int ops(vector<string> line, string& result) {
    //0 = success
    //1 = wrong operation
    //2 = wrong args

    result = "";
    if(line[0] == "ADD"){
        result += "0000";
        try
        {   if(line.size() != 4){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            if(line[3].at(0) == 'R'){
                line[3] = line[3].substr(1);
            }
            int arg3 = stoi(line[3]);
            result += itobs(arg1,3) + itobs(arg2,3) + itobs(arg3,3) + "***";
        }
        catch(exception e){ return 2; }

    }else if(line[0] == "ADDI"){
        result += "0001";
        try
        {
            if(line.size() != 4){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            int arg3 = stoi(line[3]);
            result += itobs(arg1,3) + itobs(arg2,3) + itobs(arg3,6);
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "SUB"){
        result += "0010";
        try
        {   if(line.size() != 4){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            if(line[3].at(0) == 'R'){
                line[3] = line[3].substr(1);
            }
            int arg3 = stoi(line[3]);
            result += itobs(arg1,3) + itobs(arg2,3) + itobs(arg3,3) + "***";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "SUBI"){
        result += "0011";
        try
        {
            if(line.size() != 4){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            int arg3 = stoi(line[3]);
            result += itobs(arg1,3) + itobs(arg2,3) + itobs(arg3,6);
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "NAND"){
        result += "010*";
        try
        {   if(line.size() != 4){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            if(line[3].at(0) == 'R'){
                line[3] = line[3].substr(1);
            }
            int arg3 = stoi(line[3]);
            result += itobs(arg1,3) + itobs(arg2,3) + itobs(arg3,3) + "***";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "NOR"){
        result += "011*";
        try
        {   if(line.size() != 4){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            if(line[3].at(0) == 'R'){
                line[3] = line[3].substr(1);
            }
            int arg3 = stoi(line[3]);
            result += itobs(arg1,3) + itobs(arg2,3) + itobs(arg3,3) + "***";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "READ"){
        result += "1000";
        try
        {   if(line.size() != 3){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            result += itobs(arg1,3) + itobs(arg2,3) + "******";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "WRITE"){
        result += "1010";
        try
        {   if(line.size() != 3){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            result += itobs(arg1,3) + itobs(arg2,3) + "******";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "JMP"){
        result += "1011";
        try
        {   if(line.size() != 2){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            result += itobs(arg1,3)  + "*********";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "BEQ"){
        result += "1001";
        try
        {   if(line.size() != 3){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            result += itobs(arg1,3) + itobs(arg2,3)  + "******";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "INP"){
        result += "1110";
        try
        {   if(line.size() != 2){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            result += itobs(arg1,3)  + "*********";
        }
        catch(exception e){ return 2; }
    }else if(line[0] == "OUT"){
        result += "1100";
        try
        {   if(line.size() != 3){
                return 2;
            }
            if(line[1].at(0) == 'R'){
                line[1] = line[1].substr(1);
            }
            int arg1 = stoi(line[1]);

            if(line[2].at(0) == 'R'){
                line[2] = line[2].substr(1);
            }
            int arg2 = stoi(line[2]);

            result += itobs(arg1,3) + itobs(arg2,3)   + "******";
        }
        catch(exception e){ return 2; }
    }else{
        return 1;
    }
    
    return 0;
}

bool makeTokens(string line, vector<string>& tokens) {
    size_t space = line.find(' ');

    if (space == string::npos) {
        return false;  // No space found, invalid syntax
    }

    tokens.push_back(line.substr(0, space));//add command
    // find the first comma
    size_t comma = line.find(',');

    while (comma != string::npos) {//check to see if there is commas and it's before the curr space
             
        tokens.push_back(line.substr(space+1, comma - space - 1));
        space = line.find(' ', space+1);
        comma = line.find(',', comma+1);
        if(comma < space){
            return false;
        }
    }
    tokens.push_back(line.substr(space+1));

    //validate tokens
    for(int i = 0; i < tokens.size(); i++){
        string curr = tokens.at(i);
        if(curr.find(',') != string::npos){
            return false;
        }
        if(curr.find(' ') != string::npos){
            return false;
        }
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

    //trime
    while (getline(cin, line)) {
        int comm = 0;
        while (comm < line.length() && !(line[comm] == '/' && comm + 1 < line.length() && line[comm + 1] == '/')) {
            comm++;
        }

        line.erase(comm);
        line = trim(line);

        //tokenize
        if (!line.empty()) {
            vector<string> tokens;
            //ops
            if (makeTokens(line, tokens)) {
                string result = "";
                int opsRes = ops(tokens, result);
                if(opsRes == 0){
                    cout << result << endl;
                }else if(opsRes == 1){
                    cout << "ERROR: line " << count << " (invalid operation)" << endl;
                    return 0;
                }else{
                    cout << "ERROR: line " << count << " (invalid argument)" << endl;
                    return 0;
                }
            }else{
                cout << "ERROR: line " << count << " (invalid syntax)" << endl;
                return 0;
            }
        }
        count++;
    }

    return 0;
}