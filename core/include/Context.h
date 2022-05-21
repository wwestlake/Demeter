#ifndef __CONTEXT_H
#define __CONTEXT_H

#include <string>
#include <list>
#include <map>
#include <memory>

class Node;

class Context {
    Context() : name(std::string( "__anonymous__" )) {}
    Context(std::string name) : name(name) {}

    static std::shared_ptr<Context> create() 
    {
        return std::make_shared<Context>();
    }

    static std::shared_ptr<Context> create(std::string name) 
    {
        return std::make_shared<Context>(name);
    }

    void addSymbol(std::string symbol, std::shared_ptr<Node> node)
    {
        symbol_map.insert(std::pair<std::string, std::shared_ptr<Node>>(symbol, node));
    }

private:
    std::string name;
    std::map<std::string, std::shared_ptr<Node>> symbol_map;
    std::map<std::string, std::shared_ptr<Context>> scope_map;
    std::list<std::shared_ptr<Context>> anonymous_scope_mape;

};



#endif // __CONTEXT_H