#ifndef __AST_H
#define __AST_H

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <memory>

//#include <llvm/IR/Value.h>

class CodeGenContext;

class Node {
public:

    Node() = delete;
    Node(Node& node) = delete;
    Node(Node&& other) = delete;
    virtual ~Node() {}
    //virtual llvm::Value* codeGen(CodeGenContext& context) { }


    virtual std::string exec() = 0;
};


class Program {
public:
    Program() = delete;
    Program(std::shared_ptr<Node> node) : _node(node) {}
    Program(Node& program) = delete;
    Program(Node&& other) = delete;

    std::string Execute()
    {
        return _node->exec();
    }

    static std::shared_ptr<Program> create(std::shared_ptr<Node> node) {
        return std::make_shared<Program>(node);
    };


private:
    std::shared_ptr<Node> _node;
};




#endif // __AST_H