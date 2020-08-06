#include <bits/stdc++.h>
#define MAX 100

using namespace std;

class Node {
public:
	int f;
	char c;
	Node *left, *right;
	Node (int f_, char c_) {
		f = f_;
		c = c_;
		left = NULL;
		right = NULL;
	}

};

class Comparator {
public:
	bool operator() (Node* n1, Node* n2) {
		return n1->f > n2->f;
	}
};

Node* tree(priority_queue <Node*, vector <Node*>, Comparator> min_heap) {
	
	while(min_heap.size() != 1) {
		
		Node* left = min_heap.top();
		min_heap.pop();
		Node* right = min_heap.top();
		min_heap.pop();
		Node* node = new Node(left->f + right->f, '*');
		node->left = left;
		node->right = right;
		min_heap.push(node);

	}
	return min_heap.top();

}

void print_codes (Node* root, int code[], int top) {
	
	if (root->left) {
		code[top] = 0;
		print_codes(root->left, code, top + 1);
	}
	if (root->right) {
		code[top] = 1;
		print_codes(root->right, code, top + 1);
	}

	if (!root->left && !root->right) {
		cout << root->c << " ";
		for(int i = 0; i < top; ++i) {
			cout << code[i];
		}
		cout << "\n";
	}	


}


int main() {
	
	unordered_map <char, int> f;
	priority_queue <Node*, vector<Node*>, Comparator> min_heap;
	string String = "bbabbacdaeeadffabceeef";
	
	// get  the frequencies of each char and put them in an unordered map
	for(int i = 0; i < String.size(); ++i) {
		++f[String[i]];
	}
	// create a min heap using a priority queue where each element represents a node 
	for(auto i : f) {
		Node* node = new Node(i.second, i.first);
		min_heap.push(node);
	}
	
	// create the huffman tree
	Node* root = tree(min_heap);
	int code[MAX], top = 0;
	// print the codes for each character
	print_codes(root, code, top);

	return 0;
}
