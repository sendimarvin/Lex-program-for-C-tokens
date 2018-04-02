%option noyywrap
%{
#include <stdio.h>
int countKeywords=0;
int countIdentifiers=0;
int countNumericals=0;
int countPreprocessors = 0;
int countOpenningParenthesis = 0;
int countClosingParenthesis = 0;
int countOpenningCurlyBrackets = 0;
int countClosingCurlyBrackets = 0;
int countOpenningSquareBracket = 0;
int countClosingSquareBracket = 0;
int countDelimiter = 0;
int countTermination = 0;
int countStringLiteral = 0;
int countAnd = 0;
int countEqualOperator = 0;
int countlessThan = 0;
int countIncrement = 0;
int countEquivalence = 0;
int countPlusOperator = 0;
int countNumberOfCommentsIngnored = 0;
%}
whitespace	[ \n\t\r]
preprocessor    #include<{letter}+(\.{letter}*)?>
comment         "/*"(.|\n)*"*/"	
letter		[a-zA-Z_]
digit		[0-9]
operator	[+-*/]
stringLiteral {letter}?\"(\\.|[^\\"])*\"
Keyword     if|else|while|int|switch|for|char|return|break|double
openningParenthesis [(]
closingParenthesis [)]
openningCurlyBracket [{]
closingCurlyBracket    [}]
openningSquareBracket   [[]
closingSquareBracket    []]
delimiter    [,]
termination [;]
and [&]
equalsOperator  [=]
lessThan        [<]
plusOperator    [+]
increment       "++"
equivalence     "=="

%%
{whitespace}+	{/*skip white space*/}
{preprocessor} {countPreprocessors++; /*printf("\tPREPROCESSOR: %s\n",yytext);*/}
{comment}       {countNumberOfCommentsIngnored++;}
{Keyword} {countKeywords++; /*printf("Keyword: %s \n", yytext);*/}
{letter}({letter}|{digit})* {countIdentifiers++; /*printf("Identifiers: %s \n", yytext);*/}
{digit}*	{countNumericals++;}
{openningParenthesis} {countOpenningParenthesis++;}
{closingParenthesis} {countClosingParenthesis++;}
{openningCurlyBracket} {countOpenningCurlyBrackets++;}
{closingCurlyBracket} {countClosingCurlyBrackets++;}
{openningSquareBracket} {countOpenningSquareBracket++;}
{closingSquareBracket} {countClosingSquareBracket++;}
{delimiter} {countDelimiter++;}
{termination} {countTermination++;}
{stringLiteral} {countStringLiteral++;}
{and} {countAnd++;}
{equalsOperator} {countEqualOperator++;}
{lessThan} {countlessThan++;}
{increment} {countIncrement++;}
{equivalence} {countEquivalence++;}
{plusOperator} {countPlusOperator++;}

.	{printf("invalid: %s \n", yytext);}


%%
int main(int argc[], char *argv[]){
yyin = fopen("abc.c", "r");
yylex();
printf("\n************************************************************\n");
printf("\t PREPROCESSORS: \t %d \n", countPreprocessors);
printf("\t Number of comments: \t %d ", countNumberOfCommentsIngnored);
int totalIdentifiers = 0;
totalIdentifiers = countKeywords +  countIdentifiers + countNumericals + countOpenningParenthesis 
    + countClosingParenthesis + countOpenningCurlyBrackets +countClosingCurlyBrackets
    + countOpenningSquareBracket + countClosingSquareBracket + countDelimiter + countTermination
    + countStringLiteral +countAnd + countEqualOperator + countlessThan + countIncrement + countEquivalence
    + countPlusOperator;
printf("\n************************************************************\n");
printf("\tTOTAL TOKENS FOUND: %d \n", totalIdentifiers);
printf("\t TOKEN CLASS \t NO. OF TOKENS FOUND \n");
printf("\t Keywords: \t %d \n", countKeywords);
printf("\t Identifiers: \t %d \n", countIdentifiers);
printf("\t Numerials: \t %d \n", countNumericals);
printf("\t openningParenthesis: \t %d \n", countOpenningParenthesis);
printf("\t closingParenthesis: \t %d \n", countClosingParenthesis);
printf("\t openningCurlyBracket: \t %d \n", countOpenningCurlyBrackets);
printf("\t closingCurlyBracket: \t %d \n", countClosingCurlyBrackets);
printf("\t openningSquareBracket: \t %d \n", countOpenningSquareBracket);
printf("\t closingSquareBracket: \t %d \n", countClosingSquareBracket);
printf("\t delimiter: \t %d \n", countDelimiter);
printf("\t termination: \t %d \n", countTermination);
printf("\t stringLiteral: \t %d \n", countStringLiteral);
printf("\t and: \t %d \n", countAnd);
printf("\t equalsOperator: \t %d \n", countEqualOperator);
printf("\t lessThan: \t %d \n", countlessThan);
printf("\t increment: \t %d \n", countIncrement);
printf("\t equivalence: \t %d \n", countEquivalence);
printf("\t plusOperator: \t %d \n", countPlusOperator);
return 0;
}