#include <bits/stdc++.h>
#include <ctype.h>
using namespace std;

int main() {

	ifstream file;
	file.open("text.txt");
	map<string, double> counts;
	string word;
	double no_words = 0, no_spaces = 0, info = 0;
	int n;
	
	while(file >> word) { 
		++counts[word];
		++no_words;
	}

	file.close();
	
	file.open("text.txt");
	
	while(file) {
		if (isspace(file.get())) ++no_spaces;
			
	}
	
	counts.insert( pair<string, double> ("' '", no_spaces) );
	
	no_words += no_spaces;

	cout << "no_words: " << no_words << "\n";
	
	for(auto i : counts) {
	        double prob = i.second / no_words;
	        cout << n << ". ";	
		cout << i.first << " : \n" << "count: " << i.second << "\nprob: " << prob << "\n";
		if (prob != 0) 
			info -= prob * (log(prob) / log(2));
		++n;

	}
	
	cout << "Shannon Entropy = " << info << "\n";

	file.close();
	
	return 0;
}
