from antlr4 import *
from SQLLexer import SQLLexer

def main():
    input_stream = FileStream("test.sql", encoding="utf-8")
    lexer = SQLLexer(input_stream)

    token = lexer.nextToken()
    while token.type != Token.EOF:
        print(f"Token: {lexer.symbolicNames[token.type]}, Text: {token.text}")
        token = lexer.nextToken()
   

if __name__ == "__main__":
    main()
