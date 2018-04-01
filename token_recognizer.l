%option noyywrap
%{
#include <stdio.h>
int countKeywords=0;
int countIdentifiers=0;
int countNumericals=0;
int countPreprocessors = 0;
%}
whitespace	[ \n\t\r]
letter		[a-zA-Z_]
digit		[0-9]
operator	[+-*/]

%%
{whitespace}+	{/*skip white space*/}
#include<{letter}+(\.{letter}*)?> {countPreprocessors++; printf("\tPREPROCESSOR: %s\n",yytext);}
if|else|while|int|switch|for|char {countKeywords++; /*printf("Keyword: %s, count: %d", yytext, countKeywords );*/}
{letter}({letter}|{digit})* {countIdentifiers++;}
{digit}*	{countNumericals++;}
.	{printf("invalid: %s \n", yytext);}


%%
int main(int argc[], char *argv[]){
yyin = fopen("abc.c", "r");
yylex();
printf("\n************************************************************\n");
printf("\t PREPROCESSORS: \t %d \n", countPreprocessors);
int totalIdentifiers = 0;
totalIdentifiers = countKeywords +  countIdentifiers + countNumericals;
printf("\n************************************************************\n");
printf("\tTOTAL TOKENS FOUND: %d \n", totalIdentifiers);
printf("\t TOKEN CLASS \t NO. OF TOKENS FOUND \n");
printf("\t Keywords: \t %d \n", countKeywords);
printf("\t Identifiers: \t %d \n", countIdentifiers);
printf("\t Numerials: \t %d \n", countNumericals);
return 0;
}
